class TasksController < ApplicationController
  def index
    
    sorting = "created_at ASC"
    case params[:order]
    when "end_time"
      sorting = "end_time ASC"
    end
    
    @tasks = Task.order(sorting)
    @task = Task.new
  end

  def show
    @task = Task.find_by_taskid(params[:id])
  end

  # def new
    # @task = Task.new
  # end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:notice] = t("task.create_success")
      redirect_to :action => :index
    else
      @tasks = Task.all
      render :index
      flash[:alert] = t("task.create_failed")
    end    


  end

  def edit
    @task = Task.find_by_taskid(params[:id])
  end

  def update
    @task = Task.find_by_taskid(params[:id])
    if @task.update(task_params)
      flash[:notice] = t("task.update_success")
      redirect_to :action => :index
    else
      render :edit
      flash[:alert] = t("task.update_failed")
    end
  end

  def destroy
    @task = Task.find_by_taskid(params[:id])
    if @task.destroy
      flash[:notice] = t("task.delete_success")
    else
      flash[:notice] = t("task.delete_failed")
    end  
    redirect_to :action => :index
  end

private

  def task_params
    params.require(:task).permit(:taskid, :start_time, :end_time, :status, :priority, :topic, :content)
  end
end
