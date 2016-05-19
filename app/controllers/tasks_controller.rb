class TasksController < ApplicationController
  # before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_list
  before_action :set_task, except: [:create]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  def create
    @task = @list.tasks.create(params[:task].permit(:content))
    redirect_to @list
  end

  def complete
    @task.update_attribute(:completed_at, Time.now)
    redirect_to @list, notice: "Task completed"
  end

  def incomplete
    @task.update_attribute(:completed_at, nil)
    redirect_to @list, notice: "Task marked incomplete"
  end

  # DELETE /tasks/1
  def destroy
    if @task.destroy
      flash[:success] = "Task was deleted successfully"
    else
      flash[:error] = "Task could not be deleted"
    end
    redirect_to @list
  end

  # def create
  #   @task = Task.new(task_params)

  #   respond_to do |format|
  #     if @task.save
  #       format.html { redirect_to @task, notice: 'Task was successfully created.' }
  #       format.json { render :show, status: :created, location: @task }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @task.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json


  # def update
  #   respond_to do |format|
  #     if @task.update(task_params)
  #       format.html { redirect_to @task, notice: 'Task was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @task }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @task.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  private
    def set_list
      @list = List.find(params[:list_id])
    end

    def set_task
      @task = @list.tasks.find(params[:id])
    end

    def task_params
      params[:task].permit(:content)
    end
end
