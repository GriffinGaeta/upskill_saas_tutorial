class ContactsController < ApplicationController
    
    # GET request to /contact-us 
    # Show new contact form
    def new
        @contact = Contact.new
    end
   
   
    # POST request /contacts
   def create
    #   mass assignment of form fields into Conatact object
       @contact = Contact.new(contact_params)
    #   Save the contact object to the database
       if @contact.save
        #   Store form fields via paramaters, into local variables
           name = params[:contact][:name]
           email = params[:contact][:email]
           body = params[:contact][:comments]
        #   Plug variables into the contact mailer email method and send email
           ContactMailer.contact_email(name, email, body).deliver
        #   Store success message in flash hash
        #   Redirect to the new action
           flash[:success] = "Message sent."
           redirect_to new_contact_path
       else
        #   If Contact object doesn't save,
        #  store errors in flash hash,
        #  and redirect to the new action
           flash[:danger] = @contact.errors.full_messages.join(", ")
           redirect_to new_contact_path
       end
   end
   
   private
#   To collect data from form, we need to use
#   strong parameters and whitelist the form fields
    def contact_params
       params.require(:contact).permit(:name, :email, :comments) 
    end
   
end