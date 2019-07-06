class TasksController < ApplicationController
  
  def index
    get_tasks
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
      get_tasks
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
      flash[:alert] = t("task.delete_failed")
    end  
    redirect_to :action => :index
  end
  
  def processing
    @task = Task.find_by_taskid(params[:task_id])
    if @task.may_process?
      @task.process!
      flash[:notice] = t("task.process_success")
    else
      flash[:alert] = t("task.process_failed")
    end
      redirect_to :action => :index
  end
  
  def finish
    @task = Task.find_by_taskid(params[:task_id])
    if @task.may_finish?
      @task.finish!
      flash[:notice] = t("task.finish_success")
    else
      flash[:alert] = t("task.finish_failed")
    end
      redirect_to :action => :index
  end  
  

private
  def get_tasks
    @q = Task.ransack(params[:q])
    @tasks = @q.result.page(params[:page]).per(10)
  end

  def task_params
    params.require(:task).permit(:taskid, :start_time, :end_time, :status, :priority, :topic, :content)
  end
end
