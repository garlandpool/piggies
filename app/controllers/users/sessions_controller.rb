class Users::SessionsController < Devise::SessionsController
# before_filter :configure_sign_in_params, only: [:create]

  def index_ORIGINAL_WORKING
    ###################  SEARCH CODE  ############################# 
    if params[:search]
      @users = User.search(params[:search]).order("created_at DESC")
    elsif params[:zip_search]
      @users = User.joins(:zipcodes).where( :zipcodes => {:zip => params[:zip_search]})
    else
      @users = User.order("created_at DESC")
    end
  end

  def index
    ###################  SEARCH CODE  ############################# 
    if params[:search]
      @users = User.search(params[:search]).order("created_at DESC")
    elsif params[:zip_search]
      if User.joins(:zipcodes).where( :zipcodes => {:zip => params[:zip_search]}).empty?
        @msg = "No artists are currently serving the #{params[:zip_search]} area.  Please email Jennifer Thomas to discuss options that might work for you."
        @users = User.joins(:zipcodes).where( :zipcodes => {:zip => '85350'})
      else
        @users = User.joins(:zipcodes).where( :zipcodes => {:zip => params[:zip_search]})
      end
    else
      @users = User.order("created_at DESC")
      # @zips = User.joins(:zipcodes).where( :zipcodes => {:zip => params[:zip_search]})
      # @zipcodes = Zipcode.joins(:user).where( :users => { :id => :user_id })
      # @zipcodes = Zipcode.joins(:user).where( :users => { :id => :user_id }).to_sql
    end
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
end
