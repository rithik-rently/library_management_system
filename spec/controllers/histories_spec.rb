require 'rails_helper'

RSpec.describe HistoriesController, :type => :controller do
    subject{
        create (:history)
    }

        context "if user is not authenticated then" do
            it "redirects to signin page" do
                get :index
                expect(response).to have_http_status(302)
                expect(response).to redirect_to("/users/sign_in")
            end 
        end

        context "if user is Authorized" do
            it "renders index page" do
                sign_in create(:user)
                get  :index 
                expect(response).to render_template("index")
                expect(response).to have_http_status(200)
            end 
        end
    end

