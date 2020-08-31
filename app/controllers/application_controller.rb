class ApplicationController < ActionController::Base
    before_action :authenticate_user!

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

     def configure_permitted_parameters
       devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
     end
end

def create 
  @todo = current_user.todos.new(todo_params)
    if @todo.save
      flash[:success] = "To Do Created"
      redirect_to todos_path
    else
      flash[:error] = "Error #{@todo.errors.full_messages.join('\n')}"
      render :new
    end
end