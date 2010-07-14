require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe VK::Auth do
  context "with valid email and password" do
    before do
      stub_request(:any, 'login.userapi.com/auth').with(:query => {
                                                          "site" => "2",
                                                          "pass" => "password",
                                                          "login" => "force",
                                                          "email" => "test@test.com"}).to_return(:headers => {
                                                                                                   "Location" => ";sid=123",
                                                                                                   "Set-Cookie" => "remixmid=123"},
                                                                                                 :status => 302)
    end
    
    it 'should #login! properly' do
      VK::Auth.login!("test@test.com", "password").should be(true)
    end
    
    context "should return proper" do
      before do
         VK::Auth.login!("test@test.com", "password")
      end
      
      it '#sid' do
        VK::Auth.sid.should eql "123"
      end

      it '#user_id' do
        VK::Auth.user_id.should eql "123"
      end
    end
  end
  
  context "with invalid email and password" do
    before do
      stub_request(:any, 'login.userapi.com/auth').with(:query => {
                                                          "site" => "2",
                                                          "pass" => "password",
                                                          "login" => "force",
                                                          "email" => "test@test.com"})
    end
    
    it "should error an exception" do
      lambda { VK::Auth.login!("test@test.com", "password") }.should raise_error(VK::AuthFail)
    end
  end
end
