class AddFanbaseLoyaltyToSportTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :sport_teams, :fanbase_loyalty, :integer
  end
end
