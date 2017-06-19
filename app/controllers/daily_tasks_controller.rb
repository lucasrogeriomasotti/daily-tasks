class DailyTasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_daily_task, only: [:show, :edit, :update, :destroy]

  # GET /daily_tasks
  # GET /daily_tasks.json
  def index
    @today_tasks = @user.daily_tasks.where(date: Date.today).order(date: :desc)
    if params[:show_tasks] == 'today'
      @daily_tasks = @today_tasks
    else
      @daily_tasks = @user.daily_tasks.order(date: :desc)
    end
    
    @today_tasks_time = get_today_tasks_time @today_tasks
  end

  # GET /daily_tasks/1
  # GET /daily_tasks/1.json
  def show
  end

  # GET /daily_tasks/new
  def new
    @daily_task = DailyTask.new
  end

  # GET /daily_tasks/1/edit
  def edit
  end

  # POST /daily_tasks
  # POST /daily_tasks.json
  def create
    @daily_task = DailyTask.new(daily_task_params)
    @daily_task.user = @user

    respond_to do |format|
      if @daily_task.save
        format.html { redirect_to @daily_task, notice: 'Daily task was successfully created.' }
        format.json { render :show, status: :created, location: @daily_task }
      else
        format.html { render :new }
        format.json { render json: @daily_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /daily_tasks/1
  # PATCH/PUT /daily_tasks/1.json
  def update
    respond_to do |format|
      if @daily_task.update(daily_task_params)
        format.html { redirect_to @daily_task, notice: 'Daily task was successfully updated.' }
        format.json { render :show, status: :ok, location: @daily_task }
      else
        format.html { render :edit }
        format.json { render json: @daily_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /daily_tasks/1
  # DELETE /daily_tasks/1.json
  def destroy
    @daily_task.destroy
    respond_to do |format|
      format.html { redirect_to daily_tasks_url, notice: 'Daily task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_daily_task
      @daily_task = DailyTask.where(id: params[:id], user: @user).take!
    end
    
    def set_user
      @user = current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def daily_task_params
      params.require(:daily_task).permit(:name, :duration, :date)
    end
    
    def get_today_tasks_time tasks
      time = 0
      tasks.each do |task|
        time += task.duration
      end
      return time
    end
end
