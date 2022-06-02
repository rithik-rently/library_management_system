require "rails_helper"
RSpec.describe History, :type => :model do

    it "is not valid if there isn't issue date for the book" do
        history = FactoryBot.build(:history,issue_date: nil)
         expect(history).to_not be_valid() 
     end
 
     it "must be valid if the return date is given " do
         history = FactoryBot.build(:history,return_date: "2022-05-29")
         expect(history).to be_valid()
     end
 


    it { should belong_to(:user) }

    it { should belong_to(:book) }
end