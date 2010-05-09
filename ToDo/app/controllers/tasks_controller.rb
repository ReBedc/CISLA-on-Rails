class TasksController < ApplicationController

  before_filter :get_proyect

  # GET /tasks
  # GET /tasks.xml
  def index
    @tasks = @proyect.tasks
    @search = @tasks.search(params[:search])
    @tasks = @search.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.xml
  def show
    @task = @proyect.tasks.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.xml
  def new
    @task = @proyect.tasks.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = @proyect.tasks.find(params[:id])
    lista = @task.tag_list
    lista << params[:tag_list]
    @task.tag_list = lista
    @task.save
  end

  # POST /tasks
  # POST /tasks.xml
  def create
    @task = @proyect.tasks.build(params[:task])

    respond_to do |format|
      if @task.save
        flash[:notice] = 'Task was successfully created.'
        format.html { redirect_to(proyect_task_path(@proyect, @task)) }
        format.xml  { render :xml => @task, :status => :created, :location => @task }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.xml
  def update
    @task = @proyect.tasks.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        flash[:notice] = 'Task was successfully updated.'
        format.html { redirect_to(proyect_task_path(@proyect,@task)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.xml
  def destroy
    @task = @proyect.tasks.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to(proyect_tasks_url(@proyect)) }
      format.xml  { head :ok }
    end
  end 

  private
  def get_proyect
    @proyect = Proyect.find(params[:proyect_id])
  end
end
