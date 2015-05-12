require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do

  before { sign_in_user }

  describe "GET #home" do
    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #status" do
    it "returns http success" do
      get :status
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #console" do
    it "returns http success" do
      get :console
      expect(response).to have_http_status(:success)
    end
  end

end
