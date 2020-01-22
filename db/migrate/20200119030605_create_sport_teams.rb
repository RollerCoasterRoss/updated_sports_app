class CreateSportTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :sport_teams do |t|
      t.string :team_name
      t.string :geographic_affiliation
      t.string :market_size
      t.string :notable_player
      t.text :additional_info

      t.timestamps
    end
  end 
end 
