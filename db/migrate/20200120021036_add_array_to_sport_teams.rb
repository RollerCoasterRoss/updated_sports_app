class AddArrayToSportTeams < ActiveRecord::Migration[6.0]
  def change
    change_table :sport_teams do |t|
      t.remove :geographic_affiliation
      t.string :location, array: true
    end
  end
end
