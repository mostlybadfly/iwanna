require 'rails_helper'

RSpec.describe TasksController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Task. As you add validations to Task, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { :name => 'eat ramen', :activity => 'food' }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TasksController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all tasks as @tasks" do
      task = Task.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:tasks)).to eq([task])
    end
  end

  describe "GET #show" do
    it "assigns the requested task as @task" do
      task = Task.create! valid_attributes
      get :show, {:id => task.to_param}, valid_session
      expect(assigns(:task)).to eq(task)
    end
  end

  describe "GET #new" do
    it "assigns a new task as @task" do
      get :new, {}, valid_session
      expect(assigns(:task)).to be_a_new(Task)
    end
  end

  describe "GET #edit" do
    it "assigns the requested task as @task" do
      task = Task.create! valid_attributes
      get :edit, {:id => task.to_param}, valid_session
      expect(assigns(:task)).to eq(task)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Task" do
        expect {
          post :create, {:task => valid_attributes}, valid_session
        }.to change(Task, :count).by(1)
      end

      it "assigns a newly created task as @task" do
        post :create, {:task => valid_attributes}, valid_session
        expect(assigns(:task)).to be_a(Task)
        expect(assigns(:task)).to be_persisted
      end

      it "redirects to the created task" do
        post :create, {:task => valid_attributes}, valid_session
        expect(response).to redirect_to(Task.last)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { :name => "go bowling", :activity => "sports"}
      }

      it "updates the requested task" do
        task = Task.create! valid_attributes
        put :update, {:id => task.to_param, :task => new_attributes}, valid_session
        task.reload
        expect(task.name).to eq('go bowling')
      end

      it "assigns the requested task as @task" do
        task = Task.create! valid_attributes
        put :update, {:id => task.to_param, :task => valid_attributes}, valid_session
        expect(assigns(:task)).to eq(task)
      end

      it "redirects to the task" do
        task = Task.create! valid_attributes
        put :update, {:id => task.to_param, :task => valid_attributes}, valid_session
        expect(response).to redirect_to(task)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested task" do
      task = Task.create! valid_attributes
      expect {
        delete :destroy, {:id => task.to_param}, valid_session
      }.to change(Task, :count).by(-1)
    end

    it "redirects to the tasks list" do
      task = Task.create! valid_attributes
      delete :destroy, {:id => task.to_param}, valid_session
      expect(response).to redirect_to(tasks_url)
    end
  end
end
