
require 'rails_helper'

RSpec.describe Api::V1::ContentsController, type: :controller do
  let(:user) { User.create(first_name: 'John', last_name: 'Doe', email: 'john@example.com', country: 'USA', password: 'password') }
  let(:valid_attributes) { { title: 'Sample Title', body: 'Sample Body' } }

  before do
    allow(controller).to receive(:authenticate_user).and_return(true)
    allow(controller).to receive(:current_user).and_return(user)
  end

  describe "Create conents" do
    context "with valid parameters" do
      it "creates a new Content" do
        expect {
          post :create, params: { content: valid_attributes }
        }.to change(Content, :count).by(1)
      end

      it "returns a created response" do
        post :create, params: { content: valid_attributes }
        expect(response).to have_http_status(:ok)
      end
    end

    context "with invalid parameters" do
      it "returns an unprocessable entity response" do
        post :create, params: { content: { title: '' } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
