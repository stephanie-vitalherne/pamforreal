class InstructorsController < ApplicationController
  before_action :find_instructor, only: %i[show edit update destroy]
  def index
    @instructors = Instructor.all
  end

  def show
    @page_title = "#{@instructor.full_name} | PS 118 Admin Panel"
    @course = Course.all
  end

  def new
    @page_title = 'New Instructor | PS 118 Admin Panel'
    @instructor = Instructor.new
  end

  def create
    @instructor = Instructor.new(instructor_params)
    @instructor.generate_school_id
    if @instructor.save
      flash[:notice] = 'Instructor created successfully.'
      redirect_to login_path
    else
      p @instructor.errors.full_messages
      render 'new'
    end
  end

  def edit
    @page_title = "Editing #{@instructor.full_name} | PS 118 Admin Panel"
  end

  def update
    if @instructor.update(instructor_params)
      flash[:notice] = "#{@instructor.full_name} updated successfully."
      p 'Instructor Updated'
      redirect_to @instructor
    else
      render 'edit'
    end
  end

  def destroy
    @instructor.destroy
    flash[:notice] = "#{@instructor.full_name} deleted successfully."
    redirect_to user_path
  end

  private

  def instructor_params
    params.require(:instructor).permit(:first_name, :last_name, :email, :salary, :education, :birthday, :password, :password_confirmation)
  end

  def find_instructor
    @instructor = Instructor.find(params[:id])
  end
end
