class ZipcodesController < ApplicationController
  before_action :set_zipcode, only: [:show, :edit, :update, :destroy]

  def index
########################################################### 
# KEY LEARNING POINT:  Learned how to only show the items that belong to this user
########################################################### 
    @zipcodes = Zipcode.joins(:user).where(:users => { :id => current_user.id })


###################  SEARCH CODE  ############################# 
    if params[:search]
      @zipcodes = Zipcode.search(params[:search]).order("created_at DESC")
      @artist = Artist.where(:user_id => artists.user_id)
    else
      # @zipcodes = Zipcode.order("created_at DESC")
    end

  end

  def show
  end

  def new
    @zipcode = Zipcode.new
########################################################### 
# KEY LEARNING POINT:  Learned how to assign the current_user to the item
########################################################### 
    @zipcode = current_user.zipcodes.build
  end

  def edit
  end

  def create
    @zipcode = current_user.zipcodes.build(zipcode_params)

    respond_to do |format|
      if @zipcode.save
        format.html { redirect_to @zipcode, notice: 'Zipcode was successfully created.' }
        format.json { render :show, status: :created, location: @zipcode }
      else
        format.html { render :new }
        format.json { render json: @zipcode.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @zipcode.update(zipcode_params)
        format.html { redirect_to @zipcode, notice: 'Zipcode was successfully updated.' }
        format.json { render :show, status: :ok, location: @zipcode }
      else
        format.html { render :edit }
        format.json { render json: @zipcode.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @zipcode.destroy
    respond_to do |format|
      format.html { redirect_to zipcodes_url, notice: 'Zipcode was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_zipcode
      @zipcode = Zipcode.find(params[:id])
    end

    def zipcode_params
      params.require(:zipcode).permit(:zip, :user_id, :visible)
    end
end
