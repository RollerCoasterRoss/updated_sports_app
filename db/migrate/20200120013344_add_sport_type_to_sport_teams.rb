class AddSportTypeToSportTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :sport_teams, :sport_type, :string
  end
end
