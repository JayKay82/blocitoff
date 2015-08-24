require 'rails_helper'

describe Item do

  before do
    @user = User.new(name: 'Mr White', email: 'heisenberg@methlab.com', password: 'Heisenberg')
    @user.skip_confirmation!
    @user.save
  end

  it "should start out with zero items" do
    expect(@user.items.count).to eq(0)
  end

  describe "with three items" do

    before do
        3.times { @user.items.create(name: 'Test') }
    end

    it "should save multiple items" do
      expect(@user.items.count).to eq(3)
    end

    it "should delete multiple items" do
      @user.items.destroy_all

      expect(@user.items.count).to eq(0)
    end

  end

  

end
