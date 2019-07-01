class TasksController < ApplicationController
  def index
    @tasks = Task.all
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
      flash[:notice] = "任務新增成功"
      redirect_to :action => :index
    else
      render :new
      flash[:alert] = "任務新增失敗"
    end    


  end

  def edit
    @task = Task.find_by_taskid(params[:id])
  end

  def update
    @task = Task.find_by_taskid(params[:id])
    if @task.update(task_params)
      flash[:notice] = "任務修改成功"
      redirect_to :action => :index
    else
      render :new
      flash[:alert] = "任務修改失敗"
    end
  end

  def destroy
    @task = Task.find_by_taskid(params[:id])
    if @task.destroy
      flash[:notice] = "任務刪除成功"
    else
      flash[:notice] = "任務刪除失敗"
    end  
    redirect_to :action => :index
  end

private

  def task_params
    params.require(:task).permit(:taskid, :start_time, :end_time, :status, :priority, :topic, :content)
  end
end
