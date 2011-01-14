require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe VK::User do
  before do
    @user = VK::User.new "1"
  end

  subject {@user.id}
  it {should eql 1}

  context "#friends" do
    it 'should return an Array' do
      @user.friends.should_be_instance_of Array
    end

    it 'should return only part of friends array with :to and :from paramaters'
    it 'should skip some elements if only :from paramater present'
    it 'should not return some last elements if only :to paramter present'
  end

  context "#friends_mutal" do
    it 'should return an Array' do
      @user.friends.should_be_instance_of Array
    end

    it 'should return only part of mutal friends array with :to and :from paramaters'
    it 'should skip some elements if only :from paramater present'
    it 'should not return some last elements if only :to paramter present'
  end

  context "#friends_online" do
    it 'should return an Array' do
      @user.friends_online.should_be_instance_of Array
    end

    it 'should return only part of online friends array with :to and :from paramaters'
    it 'should skip some elements if only :from paramater present'
    it 'should not return some last elements if only :to paramter present'
  end

  context "#friends_new" do
    it 'should return an Array' do
      @user.friends_new.should_be_instance_of Array
    end

    it 'should return only part of new friends array with :to and :from paramaters'
    it 'should skip some elements if only :from paramater present'
    it 'should not return some last elements if only :to paramter present'
  end

  context "#photos" do
    it 'should return an Array' do
      @user.photos.should_be_instance_of Array
    end

    it 'should return only part of photos array with :to and :from paramaters'
    it 'should skip some elements if only :from paramater present'
    it 'should not return some last elements if only :to paramter present'
  end

  context "#photos_new" do
    it 'should return an Array' do
      @user.photos_new.should_be_instance_of Array
    end

    it 'should return only part of photos array with :to and :from paramaters'
    it 'should skip some elements if only :from paramater present'
    it 'should not return some last elements if only :to paramter present'
  end

  context "#photos_with" do
    it 'should return an Array' do
      @user.photos_with.should_be_instance_of Array
    end

    it 'should return only part of photos array with :to and :from paramaters'
    it 'should skip some elements if only :from paramater present'
    it 'should not return some last elements if only :to paramter present'
  end
end

# TODO: Extract in own file
describe VK::User::Wall do
  before do
    @user = VK::User.new "1"
  end

  it 'should be a Singleton class'

  subject {user.wall_size}
  it {should eql 10}
  
  context '#wall' do
    it 'should return an Array' do
      @user.wall.should_be_instance_of Array
    end
    
    it 'should return an array of WallItems' do
      @user.wall[0].should_be_instance_of VK::User::Wall::WallItem
    end
  end
end

describe VK::User::Wall::WallItem do
  subject {@wall_item}
  it {should respond_to(:id)}
  it {should respond_to(:time)}
  it {should respond_to(:content)}
  it {should respond_to(:sender)}
  it {should respond_to(:recipient)}
  it {should respond_to(:type)}

  subject {@wall_item.time}
  it {should_be_instance of Bignum}

  context '#content' do
    it {@wall_item.content.should be_instance_of Hash}
    
    context "of 'Plain' type" do
      before do
      end

      it 'should have proper :text' do
        @wall_item.content[:text].should eql ""
      end
    end

    context "of 'Photo' type" do
      before do
      end
    end

    context "of 'Graffiti' type" do
      before do
      end
    end

    context "of 'Video' type" do
      before do
      end
    end

    context "of 'Audio' type" do
      before do
      end
    end
  end
end
