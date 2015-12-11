class PartiesController < ApplicationController
  before_action :set_party, only: [:show, :edit, :update, :destroy]

  def index
########################################################### 
# KEY LEARNING POINT:  Learned how to only show the parties that belong to this user
########################################################### 
    @parties = Party.joins(:user).where(:users => { :id => current_user.id })
  end

  def show
  end

  def new
########################################################### 
# KEY LEARNING POINT:  Learned how to assign the current_user to the party
########################################################### 
    @party = current_user.parties.build
  end

  def edit
  end

  def create
    @party = current_user.parties.build(party_params)

    respond_to do |format|
      if @party.save
        format.html { redirect_to @party, notice: 'Party was successfully created.' }
        format.json { render :show, status: :created, location: @party }
      else
        format.html { render :new }
        format.json { render json: @party.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @party.update(party_params)
        format.html { redirect_to @party, notice: 'Party was successfully updated.' }
        format.json { render :show, status: :ok, location: @party }
      else
        format.html { render :edit }
        format.json { render json: @party.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @party.destroy
    respond_to do |format|
      format.html { redirect_to parties_url, notice: 'Party was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_party
      @party = Party.find(params[:id])
    end

    def party_params
      params.require(:party).permit(:host_id, :date, :duration, :canceled, :user_id)
    end
end
