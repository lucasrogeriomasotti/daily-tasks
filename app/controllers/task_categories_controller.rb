class TaskCategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_task_category, only: [:show, :edit, :update, :destroy]

  # GET /task_categories
  # GET /task_categories.json
  def index
    @task_categories = @user.task_categories
  end

  # GET /task_categories/1
  # GET /task_categories/1.json
  def show
  end

  # GET /task_categories/new
  def new
    @task_category = TaskCategory.new
  end

  # GET /task_categories/1/edit
  def edit
  end

  # POST /task_categories
  # POST /task_categories.json
  def create
    @task_category = TaskCategory.new(task_category_params)
    @task_category.user = @user

    respond_to do |format|
      if @task_category.save
        format.html { redirect_to @task_category, notice: 'Task category was successfully created.' }
        format.json { render :show, status: :created, location: @task_category }
      else
        format.html { render :new }
        format.json { render json: @task_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /task_categories/1
  # PATCH/PUT /task_categories/1.json
  def update
    respond_to do |format|
      if @task_category.update(task_category_params)
        format.html { redirect_to @task_category, notice: 'Task category was successfully updated.' }
        format.json { render :show, status: :ok, location: @task_category }
      else
        format.html { render :edit }
        format.json { render json: @task_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_categories/1
  # DELETE /task_categories/1.json
  def destroy
    respond_to do |format|
      if @task_category.destroy
        format.html { redirect_to task_categories_url, notice: 'Task category was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html { redirect_to task_categories_url, alert: 'Task category was not successfully destroyed. Error message: ' + @task_category.errors.full_messages.first }
        format.json { render json: @task_category.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_category
      @task_category = TaskCategory.where(id: params[:id], user: @user).take!
    end
    
    def set_user
      @user = current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_category_params
      params.require(:task_category).permit(:name, :reference_url)
    end
end
