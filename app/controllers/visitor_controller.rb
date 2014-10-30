class VisitorController < ApplicationController
  def new
    @owner = Owner.new
    flash.now[:notice] = 'Welcome!'
    flash.now[:alert] = 'My birthday is soon.'

  end
  def create
    @owner = Owner.new(secure_params)
    if @owner.valid?
      @owner.subscribe
      flash[:notice] = "Signed up #{@owner.email}."
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def secure_params
    params.require(:owner).permit(:email)
  end
end
