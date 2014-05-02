class CustomersController < ApplicationController

	def new
	  @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save #Save input to new customer
      session[:customer_id] = @customer.id	  #generate session ID
      redirect_to customers_path, :notice => "You have registered." #route customer back to customers with a "sucessful" notification
    else
      flash[:notice] = "Invalid input please correct"
	  end
	end

	def index
      @customer = Customer.order(params[:sort])
	end

  def upload
    CustomerUploader.new(params[:file])
    redirect_to Customers_path
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
     @customer = Customer.find(params[:id])
  end

 def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "Customer updated"
       redirect_to customers_path
    else
      render 'edit'
    end
  end

def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    flash[:notice]="Delete Successful"
    session[:customer_id] = nil
    @current_customer=nil
      redirect_to customers_path
  end

  private
    def customer_params
      params.require(:customer).permit(:company_name,:first_name,:last_name,:email, :email_confirmation,:address_1,:address_2,:city,:state,:zip,:phone)
    end
  end

