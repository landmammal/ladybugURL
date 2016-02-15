class AddressesController < ApplicationController

  def new
    @address = Address.new
    @addresses = Address.all
  end

  def create
    @address = Address.new(address_params)
    @address.save
    redirect_to @address
  end

  def show
    redirect_to new_address_path
  end

  def magic
    @link  = Address.find(params[:id]).longurl
    if @link[0..3] == "http" 
        redirect_to "#{@link}"
      else
        redirect_to "http://#{@link}"
      end
  end

  private

  def address_params
    params.require(:address).permit(:longurl)
  end
end
