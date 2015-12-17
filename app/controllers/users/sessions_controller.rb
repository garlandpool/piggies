class Users::SessionsController < Devise::SessionsController
# before_filter :configure_sign_in_params, only: [:create]

  def index
    # @users = User.all.order("created_at DESC")
  ###################  SEARCH CODE  ############################# 
    if params[:search]
      @users = User.search(params[:search]).order("created_at DESC")
      @zipcode = Zipcode.where(:zip => '97526')
    elsif params[:zip_search]
      @users = User.search(params[:search]).order("created_at DESC")
      # @zipcode = Zipcodes.first
      # @users = User.search(params[:zip_search]).where(params[:zip_search] => @zipcode.zip)
      # @zipcode = Zipcodes.all(:joins => :user, :conditions => { :users => { :id => :user_id } })
      @zipcode = Zipcode.where(:zip => '97526')
    else
      @users = User.order("created_at DESC")
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
