require 'rails_helper'

RSpec.describe User, :type => :model do
    subject{
        create(:user)
    }


    it "is  valid with name attribute" do
        subject.name = "rithik"
        expect(subject).to be_valid
    end

    it "is not valid without name attribute" do
        subject.name = nil
        expect(subject).to_not be_valid
    end

    it "is not valid if there isn't contact number for the user" do
        user = FactoryBot.build(:user,contact: nil)
         expect(user).to_not be_valid() 
    end

    it "is not valid with password mismatch" do
        subject.password = "tTest@123"
        expect(subject).to_not be_valid
    end


    it "has one wallet" do
        should have_one(:wallet)
    end


    it "has many books" do
        should have_many(:books)
    end

    it {should have_many(:histories) }

    it {should have_many(:books) }

    it {should have_one(:wallet) }

    it {should have_one(:wallet_card).through(:wallet)}

    it "should create wallet on create user" do
        expect(subject.wallet).to_not eq(nil)
    end


end