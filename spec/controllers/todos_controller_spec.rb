require 'rails_helper'

RSpec.describe TodosController, type: :controller do

  let(:valid_attributes) {
      { :title => "Test title!" }
  }

  describe "GET #index" do
    it "returns a success response" do
        Todo.create! valid_attributes
        get :index
        expect(response).to be_successful
    end
  end

  describe "POST #create" do

    it "creates a todo" do
      post :create, params: {todo: {title: "run tests!" }}
      expect(response).to be_redirect
      expect(Todo.last.title).to eq("run tests!")
    end

  end

  describe "POST #destroy" do

    it "destroys a todo" do
      t = Todo.create! valid_attributes
      expect {
        post :destroy, params: {id: t.id}
        }.to change(Todo, :count).by(-1)
      expect(response).to be_redirect
    end

  end


end
