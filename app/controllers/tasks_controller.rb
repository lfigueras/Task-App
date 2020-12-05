class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
    @categories = Category.all
  end

  def create
    @task = Task.new(task_params)
    if @task.save
     redirect_to category_tasks_path

     else
        render 'new'
   end 
  end

  def show
      @task = Task.find(params[:id])
      @categories = @task.categories.all      
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
        redirect_to category_tasks_path(:category_id)
      else
        render :edit
      end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to category_tasks_path
  end

  private
  def task_params
    params.require(:task).permit(:title, :details, :set_date, :category_id)
  end
end