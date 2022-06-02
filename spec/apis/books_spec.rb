require 'rails_helper'

RSpec.describe "Books", :type => :request do
    context 'when authorized' do
        let(:application) { FactoryBot.create(:application) }
        let(:user)        { FactoryBot.create(:user) }
        let(:token)       { FactoryBot.create(:access_token, application: application, resource_owner_id: user.id) }

        it "creates a new book" do
            post "/api/books", params: {book: {isbn: "0-4537-2123", title: "How to Win Friends and Influence People", author: "Dale Carnegie", publisher: "Pocket Books", available_copies: 2}},
               headers: { 'Authorization': 'Bearer ' + token.token }
              expect(response).to have_http_status(200)
        end

        it "shows books available for issue" do
            book = create(:book)
            get "/api/books", params: {}, headers: {'Authorization': 'Bearer ' + token.token}
            res = JSON.parse(response.body)
            expect(response).to have_http_status(200)
            
        end

        it "updates book details successfully" do
            book = create(:book)
            put "/api/books/#{book.id}", params: {book: {available_copies: 2}}, headers: { 'Authorization': 'Bearer ' + token.token }
            expect(response).to have_http_status(200)
        end

        it "deletes a book successfully" do
            book = create(:book)
            delete "/api/books/#{book.id}", params: {}, headers: { 'Authorization': 'Bearer ' + token.token }
            expect(response).to have_http_status(200)
        end
    
    end
    
end