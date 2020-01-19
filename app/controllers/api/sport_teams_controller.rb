class Api::SportTeamsController < ApplicationController
  def index
    @sport_teams = SportTeam.all
    render "index.json.jb"
  end

  def create
    @sport_team = SportTeam.new(
                                team_name: params[:team_name],
                                geographic_affiliation: params[:geographic_affiliation],
                                market_size: params[:market_size],
                                notable_player: params[:notable_player],
                                additional_info: params[:additional_info]
                               )
    @sport_team.save
    render "show.json.jb"
  end

  def show
    @sport_team = SportTeam.find(params[:id])
    render "show.json.jb"
  end

  def update
    @sport_team = SportTeam.find(params[:id])
    
    @sport_team.team_name = params[:team_name] || @sport_team.team_name
    @sport_team.geographic_affiliation = params[:geographic_affiliation] || @sport_team.geographic_affiliation
    @sport_team.market_size = params[:market_size] || @sport_team.market_size
    @sport_team.notable_player = params[:notable_player] || @sport_team.notable_player
    @sport_team.additional_info = params[:additional_info] || @sport_team.additional_info

    @sport_team.save
    render "show.json.jb"
  end

  def destroy
    sport_team = SportTeam.find(params[:id])
    sport_team.destroy

    render json: {message: "Team Deleted From Database!"}
  end
end
