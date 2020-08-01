class TodosController < ApplicationController

  def index
    @todos = Todo.all.order(created_at: "DESC")
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      flash[:notice] = "Todo created!"
      redirect_to todos_path
    else
      flash[:alert] = "Error while creating todo"
      render :new
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    if @todo && @todo.destroy
      flash[:notice] = "Todo removed!"
      redirect_to todos_path and return
    end
    flash[:alert] = "Couldn't remove Todo!"
    redirect_to todos_path
  end

  protected

  def todo_params
    params.require(:todo).permit(:title)
  end

end
