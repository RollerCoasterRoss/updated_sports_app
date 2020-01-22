class ChangeLocationOnSportTeams < ActiveRecord::Migration[6.0]
  def change
    remove_column :sport_teams, :location, :string
    add_column :sport_teams, :city_region, :string
  end
end
