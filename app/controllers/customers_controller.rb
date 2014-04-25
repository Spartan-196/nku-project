class CustomersController < ApplicationController

	def new
	  @customer = Customer.new
  end

  def create
    @customer= Customer.new(customer_params)
    if @customer.save #Save input to new customer
      session[:customer_id] = @customer.id	  #generate session ID
      redirect_to customers_path, :notice => "You have registered." #route user back to users with a "sucessful" notification
    else
      flash[:notice] = "Invalid input please correct"
	  end
	end

	def index
      @customer = Customer.all
	end

  private
    def customer_params
      params.require(:customer).permit(:company_name,:first_name,:last_name,:email, :email_confirmation,:address_1,:address_2,:city,:state,:zip)
    end
  end

