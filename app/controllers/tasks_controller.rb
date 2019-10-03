class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]

  def index
    @tasks = Task.all
  end

  def show; end

  def new
    @task = Task.new
  end

  def edit; end

  def create
    @task = Task.new(task_params)

    if task.save
      redirect_to @task, notice: "タスク #{@task.title}を作成しました"
    else
      render :new
    end
  end

  def update
    if @task.update(task_params)
      redirect_to @task, notice: "タスク #{@task.title}を更新しました"
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirest_to tasks_url, notice: "タスクを #{@task.title}削除しました"
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :finished)
  end
end
