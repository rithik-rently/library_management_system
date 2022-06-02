FactoryBot.define do 
    factory :history do
        issue_date {"2022-05-26"}
        return_date {"2022-05-29"}
        users_id { FactoryBot.create(:user).id}
        books_id { FactoryBot.create(:book).id}
    end 
end