class FriendsController < ApplicationController
  
  #we call the instance variable every where (even in views)
  def index
    #@friends =Friend.all
    @friends = Friend.where(:user_id=>current_user.id)
   #make an instance @friends which return the value in array
    #puts 'aaaaaaaaaaaaa',@friends.inspect
  #aaaaaa
  end
  def new
    #make an instance @friend which is object
    #Friend.new in this " . " is used for calling the new method
    @friend = Friend.new
  end
  def create
    #here asim_params method is call after defining the method "asim_params"
    @friend = Friend.new(asim_params)
    #here we assign the value (current_user.id) to user_id by instance 
    @friend.user_id = current_user.id
    
    if @friend.save
      flash[:notice] = "Information Saved"
      
      redirect_to root_path
      
    else
      flash[:notice] = "Information not saved from #{@friend.name}"
      
      redirect_to root_path
    end
  end
  
  def show
    #@friends = Friend.where(:user_id=>current_user.id)
   # @friend = Friend.find(params[:id])
   # @friends =Friend.all
    @friend = Friend.find(params[:id])
   # puts 'xxxxxxxxxxxxxxxxxxxxxx' , @friend.inspect    
    #dddd
  end
  def asim_params

    params.require(:friend).permit(:first_name,:last_name,:phone)
    
  end
   #def find_friend
    #@friend = Friend.find(params[:id])
  #end
  
end
