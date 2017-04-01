class CustomeBookingsController < ApplicationController
  before_action :set_custome_booking, only: [:show, :edit, :update, :destroy]

  # GET /custome_bookings
  # GET /custome_bookings.json
  def index
    @custome_bookings = CustomeBooking.order(created_at: :desc).includes(:customer)
  end

  # GET /custome_bookings/1
  # GET /custome_bookings/1.json
  def show
  end

  # GET /custome_bookings/new
  def new
    @custome_booking = CustomeBooking.new
    set_customers
  end

  # GET /custome_bookings/1/edit
  def edit
    set_customers
  end

  # POST /custome_bookings
  # POST /custome_bookings.json
  def create
    @custome_booking = CustomeBooking.new(custome_booking_params)
    set_customers

    respond_to do |format|
      if @custome_booking.save
        format.html { redirect_to @custome_booking, notice: 'Custome booking was successfully created.' }
        format.json { render :show, status: :created, location: @custome_booking }
      else
        format.html { render :new }
        format.json { render json: @custome_booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /custome_bookings/1
  # PATCH/PUT /custome_bookings/1.json
  def update
    set_customers
    respond_to do |format|
      if @custome_booking.update(custome_booking_params)
        format.html { redirect_to @custome_booking, notice: 'Custome booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @custome_booking }
      else
        format.html { render :edit }
        format.json { render json: @custome_booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /custome_bookings/1
  # DELETE /custome_bookings/1.json
  def destroy
    @custome_booking.destroy
    respond_to do |format|
      format.html { redirect_to custome_bookings_url, notice: 'Custome booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_custome_booking
      @custome_booking = CustomeBooking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def custome_booking_params
      params.require(:custome_booking).permit(:name, :customer_id)
    end

    # Use callback to share common setup or constraints betwwen actions.
    def set_customers
      @customers = Customer.all.
         collect do |c|
            [c.name, c.id]
         end
    end
end
