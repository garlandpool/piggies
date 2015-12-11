class HostsController < ApplicationController
  before_action :set_host, only: [:show, :edit, :update, :destroy]

  def index
########################################################### 
# KEY LEARNING POINT:  Learned how to only show the hosts that belong to this user
########################################################### 
    @hosts = Host.joins(:user).where(:users => { :id => current_user.id })
  end

  def show
  end

  def new
    @host = current_user.hosts.build 
  end

  def edit
  end

  def create
    @host = current_user.hosts.build(host_params)

    respond_to do |format|
      if @host.save
        format.html { redirect_to @host, notice: 'Host was successfully created.' }
        format.json { render :show, status: :created, location: @host }
      else
        format.html { render :new }
        format.json { render json: @host.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @host.update(host_params)
        format.html { redirect_to @host, notice: 'Host was successfully updated.' }
        format.json { render :show, status: :ok, location: @host }
      else
        format.html { render :edit }
        format.json { render json: @host.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @host.destroy
    respond_to do |format|
      format.html { redirect_to hosts_url, notice: 'Host was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_host
      @host = Host.find(params[:id])
    end

    def host_params
      params.require(:host).permit(:first, :last, :street, :city, :state, :zipcode, :h_phone, :c_phone, :visible, :user_id)
    end
end
