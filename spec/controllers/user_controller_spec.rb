require "rails_helper"

RSpec.describe Admin::UsersController, type: :controller do
  let(:user) {FactoryBot.create :user}
  let(:valid_attributes) {FactoryBot.attributes_for :user}
  let(:invalid_attributes) {FactoryBot.attributes_for :user, name: ""}

  context "user is admin" do
    before do
      admin = FactoryBot.create :user
      @current_user = admin
      sign_in admin
    end

    describe "DELETE #destroy" do
      context "resource exist" do
        it "assigns @user" do
          user = User.create! valid_attributes
          expect(assigns(:user)).to eq assigns(:user)
        end

        it "destroy succes" do
          user = User.create! valid_attributes
          delete :destroy, params: {id: user}
          expect(flash[:success]).to eq "Success"
        end

        it "destroy not succes" do
          allow_any_instance_of(User).to receive(:destroy).and_return(false)
            delete :destroy, params: {id: user}
          expect(flash[:danger]).to eq "Error"
        end
      end
      
      context "resource not found" do
        it do
          delete :destroy, params: {id: -1}
          expect(response).to redirect_to admin_index_path
        end
      end
    end
  end
end
