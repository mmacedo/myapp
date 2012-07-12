require 'spec_helper'

describe ElectionsController do

  def valid_attributes_with_associations
    build(:election).attributes
  end

  def valid_attributes
    attributes_for(:election)
  end

  describe "GET index" do
    it "assigns all elections as @elections" do
      election = create(:election)
      get :index, {}
      assigns(:elections).should eq([election])
    end
  end

  describe "GET show" do
    it "assigns the requested election as @election" do
      election = create(:election)
      get :show, {id: election.to_param}
      assigns(:election).should eq(election)
    end
  end

  context "logged in" do

    login_user

    it "should have a current_user" do
      subject.current_user.should_not be_nil
    end

    describe "GET new" do
      it "assigns a new election as @election" do
        get :new, {}
        assigns(:election).should be_a_new(Election)
      end
    end

    describe "GET edit" do
      it "assigns the requested election as @election" do
        election = create(:election)
        get :edit, {id: election.to_param}
        assigns(:election).should eq(election)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new Election" do
          expect {
            post :create, {election: valid_attributes_with_associations}
          }.to change(Election, :count).by(1)
        end

        it "assigns a newly created election as @election" do
          post :create, {election: valid_attributes_with_associations}
          assigns(:election).should be_a(Election)
          assigns(:election).should be_persisted
        end

        it "redirects to the created election" do
          post :create, {election: valid_attributes_with_associations}
          response.should redirect_to(Election.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved election as @election" do
          # Trigger the behavior that occurs when invalid params are submitted
          Election.any_instance.stub(:save).and_return(false)
          post :create, {election: {}}
          assigns(:election).should be_a_new(Election)
        end

        it "re-renders the 'new' template" do
          # Trigger the behavior that occurs when invalid params are submitted
          Election.any_instance.stub(:update_attributes).and_return(false)
          post :create, {election: {}}
          response.should render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "updates the requested election" do
          election = create(:election)
          # Assuming there are no other elections in the database, this
          # specifies that the Election created on the previous line
          # receives the :update_attributes message with whatever params are
          # submitted in the request.
          Election.any_instance.should_receive(:update_attributes).
                            with({"these" => "params"})
          put :update, {id: election.to_param, election: {"these" => "params"}}
        end

        it "assigns the requested election as @election" do
          election = create(:election)
          put :update, {id: election.to_param, election: valid_attributes}
          assigns(:election).should eq(election)
        end

        it "redirects to the election" do
          election = create(:election)
          put :update, {id: election.to_param, election: valid_attributes}
          response.should redirect_to(election)
        end
      end

      describe "with invalid params" do
        it "assigns the election as @election" do
          election = create(:election)
          # Trigger the behavior that occurs when invalid params are submitted
          Election.any_instance.stub(:save).and_return(false)
          put :update, {id: election.to_param, election: {}}
          assigns(:election).should eq(election)
        end

        it "re-renders the 'edit' template" do
          election = create(:election)
          # Trigger the behavior that occurs when invalid params are submitted
          Election.any_instance.stub_chain(:errors, :empty?).and_return(false)
          Election.any_instance.stub_chain(:errors, :clear).and_return(nil)
          put :update, {id: election.to_param, election: {}}
          response.should render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested election" do
        election = create(:election)
        expect {
          delete :destroy, {id: election.to_param}
        }.to change(Election, :count).by(-1)
      end

      it "redirects to the elections list" do
        election = create(:election)
        delete :destroy, {id: election.to_param}
        response.should redirect_to(elections_url)
      end
    end
  end
end
