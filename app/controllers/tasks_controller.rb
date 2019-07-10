class TasksController < ApplicationController
  before_action :authorize, :current_user
  before_action :get_tasks, :only => :index
  before_action :get_task, :only => [:show, :edit, :update, :delete, :processing, :finish]
  before_action :get_search_tags, :only => :index
  
  
  def index
    @task = Task.new
  end

  def show
  end

  def create
    @task = Task.new(task_params)
    if @task.save and @current_user
      UserTaskship.create( :user => @current_user, :task => @task )
      @task.insert_tags(params[:task][:all_tags])
      flash[:notice] = t("task.create_success")
      redirect_to :action => :index
    else
      get_tasks
      get_search_tags
      render :index
      flash[:alert] = t("task.create_failed")
    end    
  end

  def edit
  end

  def update
    if @task.update(task_params)
      @task.insert_tags(params[:task][:all_tags])
      flash[:notice] = t("task.update_success")
      redirect_to :action => :index
    else
      render :edit
      flash[:alert] = t("task.update_failed")
    end
  end

  def destroy
    if @task.destroy
      flash[:notice] = t("task.delete_success")
    else
      flash[:alert] = t("task.delete_failed")
    end  
    redirect_to :action => :index
  end
  
  def processing
    if @task.may_process?
      @task.process!
      flash[:notice] = t("task.process_success")
    else
      flash[:alert] = t("task.process_failed")
    end
      redirect_to :action => :index
  end
  
  def finish
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
    @q = @current_user.tasks
    if params[:tag]
      @q = @q.tagged_with(params[:tag])
    end
    @q = @q.includes(:users).ransack(params[:q])
    @tasks = @q.result.page(params[:page]).per(10)
  end
  
  def get_task
    id =  params[:id] || params[:task_id]
    @task = @current_user.tasks.find_by_taskid(id)
    if @task.nil?
      redirect_to tasks_path, alert: t('task.notexist')
    end
  end
  
  def get_search_tags
    @search_tags = Task.select("tagname,count(tasks.id) as count").joins(:tags, :users).where("users.id" => @current_user).group("tags.id").limit(20)
  end

  def task_params
    params.require(:task).permit(:taskid, :start_time, :end_time, :status, :priority, :topic, :content)
  end
end
