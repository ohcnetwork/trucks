class EntriesController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_entry, only: [:show, :edit, :update]

  def list
    @entires_scope = if current_user.phone_caller?
      current_user.entries
    else
      Entry.all
    end
  end

  def index
  end

  def show
    @entry = Entry.find(params[:id])
  end

  def new
    @entry = Entry.new
  end

  def edit
  end

  def create
    @entry = Entry.new(entry_params)
    vehicle = Vehicle.where(number: entry_params['vehicle_number'].downcase).first_or_create!
    @entry.user_id = current_user.id
    @entry.vehicle_id = vehicle.id

    respond_to do |format|
      if @entry.save
        format.html { redirect_to root_path, notice: "Truck data was added Successfully" }
      else
        format.html { render :new }
      end
    end
  end

  # def update
  #   respond_to do |format|
  #     if @entry.update(application_params)
  #       format.html { redirect_to @entry, notice: "Truck data was updated successfully." }
  #       format.json { render :show, status: :ok, location: @entry }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @entry.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def set_entry
    @entry = Entry.find(params[:id])
  end

  private

  def entry_params
    params.require(:entry).permit(:vehicle_number, :number_of_driver, :name_of_driver, :status, :state_id)
  end
end
