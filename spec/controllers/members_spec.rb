require 'rails_helper'

RSpec.describe MembersController, :type => :controller do
  subject {
    create(:user)
  }

    context "if user is not authenticated then" do
      it "redirects to signin page" do
        get :index
        expect(response).to have_http_status(302)
        expect(response).to redirect_to("/users/sign_in") 
      end
    end

    context "if user is authenticated then" do
      it "renders home view" do
        sign_in subject
        get :index
        expect(response).to render_template(:index) 
      end
    end
  end