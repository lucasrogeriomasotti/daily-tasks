class TaskLogsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_task_log, only: [:show, :edit, :update, :destroy]

  # GET /task_log
  # GET /task_log.json
  def index
    @today_tasks = @user.task_logs.where(date: Date.current).order(date: :desc)
    if params[:show_tasks] == 'today'
      @task_logs = @today_tasks
    else
      @task_logs = @user.task_logs.order(date: :desc)
    end
    
    @today_tasks_time = get_today_tasks_time @today_tasks
  end

  # GET /task_log/1
  # GET /task_log/1.json
  def show
  end

  # GET /task_log/new
  def new
    @tasks = Task.order(:name)
    @task_log = TaskLog.new
    @task_log.date = Date.current
  end

  # GET /task_log/1/edit
  def edit
    @tasks = Task.order(:name)
  end

  # POST /task_log
  # POST /task_log.json
  def create
    @task_log = TaskLog.new(task_log_params)
    @task_log.user = @user

    respond_to do |format|
      if @task_log.save
        format.html { redirect_to task_log_path(@task_log), notice: 'Task log was successfully created.' }
        format.json { render :show, status: :created, location: @task_log }
      else
        format.html { render :new }
        format.json { render json: @task_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /task_log/1
  # PATCH/PUT /task_log/1.json
  def update
    respond_to do |format|
      if @task_log.update(task_log_params)
        format.html { redirect_to task_log_path, notice: 'Task log was successfully updated.' }
        format.json { render :show, status: :ok, location: @task_log }
      else
        format.html { render :edit }
        format.json { render json: @task_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_log/1
  # DELETE /task_log/1.json
  def destroy
    @task_log.destroy
    respond_to do |format|
      format.html { redirect_to task_logs_url, notice: 'Task log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_log
      @task_log = TaskLog.where(id: params[:id], user: @user).take!
    end
    
    def set_user
      @user = current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_log_params
      params.require(:task_log).permit(:name, :duration, :date, :description, :task_id)
    end
    
    def get_today_tasks_time tasks
      time = 0
      tasks.each do |task|
        time += task.duration if task.duration.present?
      end
      return time
    end
end
