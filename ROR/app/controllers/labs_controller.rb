class LabsController < ApplicationController
  def index
    @labs=Lab.all
  end
  def show
    @lab=Lab.find(params[:id])
  end
  def new
    @lab=Lab.new
  end
  def create
    lab=Lab.new(params.require(:lab).permit(:title,:description))
    lab.user_id=1
    if lab.save
      redirect_to root_path
    else
      redirect_to root_path
      flash[:DANGER] = "Lab wasn't created! "
    end
  end
  def edit
    @lab=Lab.find(params[:id])
  end
  def update
    @lab=Lab.find(params[:id])
    @lab.update(params.require(:lab).permit(:title,:description))
    redirect_to root_url
  end
  def destroy
    @lab=Lab.find(params[:id])
    @lab.destroy
    redirect_to root_url
  end
  def mark
    @lab=Lab.find(params[:id])
  end
  def grade
    @lab=Lab.find(params[:id])
    if @lab.update(params.permit(:grade))
    redirect_to root_url
    else
      render :mark
      end
  end
end
