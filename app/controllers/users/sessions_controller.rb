class Users::SessionsController < Devise::SessionsController
# before_filter :configure_sign_in_params, only: [:create]

  def index
    ###################  SEARCH CODE  ############################# 
    if params[:search]
      @users = User.search(params[:search]).order("created_at DESC")
    elsif params[:zip_search]
      @users = User.joins(:zipcodes).where( :zipcodes => {:zip => params[:zip_search]})
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
<<<<<<< HEAD
end
=======
end
>>>>>>> 9a7ba036984ee6ae836fa40302a12e85546a632f
