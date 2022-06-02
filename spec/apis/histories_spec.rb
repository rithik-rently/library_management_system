require 'rails_helper'

RSpec.describe "Histories", :type => :request do
    context 'when authorized' do
        let(:application) { FactoryBot.create(:application) }
        let(:user)        { FactoryBot.create(:user) }
        let(:token)       { FactoryBot.create(:access_token, application: application, resource_owner_id: user.id) }

        it "creates a new history" do
            post "/api/histories", params: {history: {users_id: 11, books_id: 14, issue_date: "2022-06-01", return_date: "2022-06-03"}},
               headers: { 'Authorization': 'Bearer ' + token.token }
              expect(response).to have_http_status(200)
        end

        it "shows history of the particular member" do
            history = create(:history,users_id: user.id)
            get "/api/histories", params: {}, headers: {'Authorization': 'Bearer ' + token.token}
            res = JSON.parse(response.body)
            expect(response).to have_http_status(200)
            
        end


        it "updates history details successfully" do
            history = create(:history,users_id: user.id)
            put "/api/histories/#{history.id}", params: {book: {title: "Power"}}, headers: { 'Authorization': 'Bearer ' + token.token }
            expect(response).to have_http_status(200)
        end

        it "deletes a history successfully" do
            history = create(:history, users_id: user.id)
            delete "/api/histories/#{history.id}", params: {}, headers: { 'Authorization': 'Bearer ' + token.token }
            expect(response).to have_http_status(200)
        end
    end
end
