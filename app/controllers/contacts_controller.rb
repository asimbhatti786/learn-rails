class ContactsController < ApplicationController
  before_filter :authenticate_user!
  #def process_form
  #Rails.logger.debug "DEBUG: params are #{params}"
  #flash[:notice] = "Received request from #{params}[:contact][:name]"
  before_action :find_contact , only: [:edit,:update,:destroy]
  #redirect_to root_path
  def index
    @contacts = Contact.all
    #@contacts = Contact.find_by_sql('SELECT * FROM contact')
  end
  def new
    #Contact is class name.
    #new is a constructor
    #Against new action it will render html form from views
    @contact = Contact.new 
  end

  def create
    @contact = Contact.new(asim_params)
    if @contact.save


      #@contact.update_spreadsheet

      #UserMailer.contact_email(@contact).deliver

      flash[:notice] = "Message sent from #{@contact.name}."

      redirect_to root_path

    else

      flash[:notice] = "{@contact.errors.full_messages.join(',')}"

      redirect_to root_path

    end
  end
  def edit
    
  end
  
  def update
    if @contact.update_attributes(asim_params)
      flash[:notice] = "Message sent from #{@contact.name}."

      redirect_to root_path
    else

      flash[:notice] = "{@contact.errors.full_messages.join(',')}"

      redirect_to root_path
    end
  end
  def destroy
    
    if @contact.destroy
 flash[:notice] = "Deleted Successfully"
      redirect_to root_path
    end
  end

  private

  def asim_params

    params.require(:contact).permit(:name,:email)
  end
  
  def find_contact
    @contact = Contact.find(params[:id])
  end
  
  
  

end
