class StudentsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, only: [:destroy]

  def index
    @students = Student.all.order(:l_name)
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    Student.create(student_params)
    flash[:success] = 'Student has been successfully created.'
    redirect_to students_path
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    student = Student.find(params[:id])
    student.update(student_params)
    redirect_to students_path
  end

  def destroy
    Student.find(params[:id]).destroy
		redirect_to '/students'
    # @students = Student.destroy(params[:id])
    # @students.delete
    # redirect_to students_path
    # render json: {status: 'success', message: 'Student was successfully deleted'}
  end

  private

  def student_params
    params.require(:student).permit(:f_name, :l_name, :birthday, :age, :education)
  end

end
