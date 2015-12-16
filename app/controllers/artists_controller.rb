class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update, :destroy]

  def index_ORIGINAL
    @artists = Artist.all.order("created_at DESC")
    @user = User.find_by_email!(params[@artists.email])
  end

  def index_BAKBAKBAKBAKBAKBAKBAKBAKBAKBAKBAKBAK
    if params[:email].blank?
      @artists = Artist.all.order("created_at DESC")
    else
      # @user_id = User.find_by(name: params[:email]).id
      @user_email = User.find_by(params[:email]).email
      @artists = Job.where(email: @user_email).order("created_at DESC")
    end

###################  SEARCH CODE  ############################# 
    if params[:search]
      @artists = Artist.search(params[:search]).order("created_at DESC")
    else
      @artists = Artist.order("created_at DESC")
    end

  end


  def show

  end

  def new
    # @artist = Artist.new
    @artist = current_user.artist.build
  end

  def edit
  end

  def create
    # @artist = Artist.new(artist_params)
    @artist = current_user.artist.build(artist_params)

    respond_to do |format|
      if @artist.save
        format.html { redirect_to @artist, notice: 'Artist was successfully created.' }
        format.json { render :show, status: :created, location: @artist }
      else
        format.html { render :new }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @artist.update(artist_params)
        format.html { redirect_to @artist, notice: 'Artist was successfully updated.' }
        format.json { render :show, status: :ok, location: @artist }
      else
        format.html { render :edit }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @artist.destroy
    respond_to do |format|
      format.html { redirect_to artists_url, notice: 'Artist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_artist
      @artist = Artist.find(params[:id])
      # @artists = Artist.find_by_id!(params[@artists.user_id])
      # @artists = Artist.find_by_id!(params[user_id])
    end

    def artist_params
      params.require(:artist).permit(:first, :last, :title, :email, :address, :city, :state, :zipcode, :bday, :bmonth, :byear, :homephone, :cellphone, :officephone, :zipareas, :contract_day, :contract_month, :contract_year, :user_id)
    end
end
