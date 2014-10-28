class UsersController < ApplicationController

  # this page should show...
  # all of the Users ever
  def index
    @Users = User.all
  end

  def new
    @User = User.new
  end

# The task at hand
  def edit
     @User = User.find(params[:id])
  end

  def create
    @User = User.new(User_params)
    @User.save
    redirect_to Users_path, notice: 'User was successfully created.'
  end

# The task at hand








  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def User_params
      params.require(:User).permit(:date, :location, :description, :capacity, :requiresid)
    end

end
