class TeamsController < ApplicationController
  load_and_authorize_resource
  before_filter :authenticate_user!
  before_action :set_team, only: [:show, :edit, :update, :destroy]


  def index
    if current_user.is_admin == true
    @teams = Team.all
  else
    @teams =Team.where(:user_id => current_user.id)
  end
end

  def show
  end


  def new
    @team = Team.new
  end

  def edit
  end

  def create
    @team = Team.new(team_params)
      respond_to do |format|
      if @team.save
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
        format.json { render action: 'show', status: :created, location: @team }
      else
        format.html { render action: 'new' }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
       format.json { respond_with_bip(@team) }
      else
         format.html { render action: 'new' }
       format.json { respond_with_bip(@team) }
      end
    end
  end

  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:name, :description,:user_id)
    end
end
