require "rails_helper"
RSpec.describe Book, :type => :model do
    it "must have isbn" do
       book = FactoryBot.build(:book,isbn: nil)
        expect(book).to_not be_valid() 
    end

    it "must have a book value" do
        book = build(:book)
        expect(book).to be_valid()
    end

   it "is not valid without the title" do
       book = build(:book,title: nil)
       expect(book).to_not be_valid()
    end

    it "is not valid without the author name" do
       book = build(:book,author: nil)
       expect(book).to_not be_valid()
    end

    it "is not valid without the publisher" do
        book = build(:book,publisher: nil)
        expect(book).to_not be_valid()
     end

    it "is not valid if the available copies is less than 0" do
        book = build(:book,available_copies: -1)
        expect(book).to_not be_valid()
     end

    it { should have_many(:users).through(:histories) }

    it { should have_many(:histories) }

end
