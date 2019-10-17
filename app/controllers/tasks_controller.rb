class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]

  def index
    @task = Task.new
    @tasks = Task.all
  end

  def show; end

  def new; end

  def edit; end

  # rubocop:disable Metrics/AbcSize
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: "タスク #{@task.title} を追加しました。" }
        format.json { render action: 'show', status: :created, location: @task }
      else
        format.html { redirect_to tasks_url, notice: 'タスクを入力してください。' }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end
  # rubocop:enable Metrics/AbcSize

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: "タスク #{@task.title} を更新しました。" }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "タスク #{@task.title} を削除しました。" }
      format.json { head :no_content }
    end
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :finished)
  end
end
