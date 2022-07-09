require 'rails_helper'

RSpec.describe BooksController, :type => :controller do
  subject {
    create(:book)
  }

    context "if user is authenticated then" do
      it "renders index page" do
        sign_in create(:user)
        book = create(:book)
        get :index
        # expect(assigns(:book)).to eq([book.title])
        expect(response).to have_http_status(200)
      end

      it "lists books taken by current user" do
        user = create(:user)
        sign_in user
        book = create(:book)
        create(:history,users_id: user.id,books_id: book.id)
        get :show, params: {title: book.title}
        expect(assigns(:book)).to eq(book)
      end

      it "shows book details of the current user" do
        user = create(:user)
        sign_in user
        book = create(:book)
        get :current_history, params: {id: book.id}
        assigns(:book).should eq(book)
      end

      it "must issue book to the member" do
        user = create(:user)
        sign_in user
        book = create(:book)
        old_available_copies = book.available_copies 
        get :issue , params: {id: book.id}
        expect(assigns(:book).available_copies).to eq(old_available_copies - 1)
        
      end

      it "must redirect to index after issue " do
        user = create(:user)
        sign_in user
        book = create(:book)
        get :issue , params: {id: book.id}
        expect(response).to redirect_to("/borrowed")
      end

      

      it "must return book to books" do
        user = create(:user)
        sign_in user
        book = create(:book)
        old_available_copies = book.available_copies 
        get :return , params: {id: book.id}
        expect(assigns(:book).available_copies).to eq(old_available_copies+1)
      end

      it "must redirect to index after return " do
        user = create(:user)
        sign_in user
        book = create(:book)
        get :return , params: {id: book.id}
        expect(response).to redirect_to("/borrowed")
      end
    end   
end