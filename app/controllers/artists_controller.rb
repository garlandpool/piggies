class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update, :destroy]

  # GET /artists
  # GET /artists.json
  def index_ORIGINAL
    @artists = Artist.all.order("created_at DESC")
    @user = User.find_by_email!(params[@artists.email])
  end

  def index
    if params[:email].blank?
      @artists = Artist.all.order("created_at DESC")
    else
      # @user_id = User.find_by(name: params[:email]).id
      @user_email = User.find_by(params[:email]).email
      @artists = Job.where(email: @user_email).order("created_at DESC")
    end
  end

# =============================
  def index_from_jobs
    if params[:category].blank?
      @jobs = Job.all.order("created_at DESC")
    else
      @category_id = Category.find_by(name: params[:category]).id
      @jobs = Job.where(category_id: @category_id).order("created_at DESC")
    end
  end
# =============================


  # GET /artists/1
  # GET /artists/1.json
  def show
  end

  # GET /artists/new
  def new
    @artist = Artist.new
  end

  # GET /artists/1/edit
  def edit
    #  EXPERIMENTAL LINE...PROBABLY DELETE LATER...
    #  IT WOULD DEPEND ON ADDING user_id TO ARTISTS TABLE
    # @artist.user_id = current_user.artist_id
  end

  # POST /artists
  # POST /artists.json
  def create
    @artist = Artist.new(artist_params)

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

  # PATCH/PUT /artists/1
  # PATCH/PUT /artists/1.json
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

  # DELETE /artists/1
  # DELETE /artists/1.json
  def destroy
    @artist.destroy
    respond_to do |format|
      format.html { redirect_to artists_url, notice: 'Artist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artist
      @artist = Artist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def artist_params
      params.require(:artist).permit(:first, :last, :title, :email, :address, :city, :state, :zipcode, :bday, :bmonth, :byear, :homephone, :cellphone, :officephone, :zipareas, :contract_day, :contract_month, :contract_year)
    end
end
