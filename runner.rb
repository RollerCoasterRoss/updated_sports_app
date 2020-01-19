require 'http'

while true
  puts "-" * 25
  puts "Type 0(Number) to exit program."
  puts "Type 1 to Create new team in DB."
  puts "Type 2 to Read teams in DB."
  puts "Type 3 to Update specific team attribute."
  puts "Type 4 to Delete team from DB."
  puts "-" * 25
  user_input = gets.chomp

  if user_input == "0"
    puts "Exiting program..."
    break
  elsif user_input == "1"
    puts "Enter Team Name now:"
    create_input_1 = gets.chomp
    puts "Enter Geographic Affiliation Now:"
    create_input_2 = gets.chomp
    puts "Enter Team Market Size Now:"
    create_input_3 = gets.chomp
    puts "Enter Single Player Now:"
    create_input_4 = gets.chomp
    puts "Enter Any Additional Comments Now:"
    create_input_5 = gets.chomp

    response = HTTP.post("http://localhost:3000/api/sport_teams", :params => {team_name: create_input_1, geographic_affiliation: create_input_2, market_size: create_input_3, notable_player: create_input_4, additional_info: create_input_5})
  elsif user_input == "2"
    response = HTTP.get("http://localhost:3000/api/sport_teams")
    all_teams = response.parse(@sport_teams)

    puts "Filter by:"
    puts "Type 0 for all teams in order of ID"
    puts "Type 1 to search for one instance via ID"
    puts "Type 2 for City/Region"
    puts "Type 3 for Market Size"
    filter_input = gets.chomp

    if filter_input == "0"
      filter_0_arr = []
      all_teams.each do |team|
        filter_0_arr << team
      end

      final_filter_arr = filter_0_arr.sort_by{|filter_0_hash| filter_0_hash["id"]}
      final_filter_arr.each do |team|
        puts
        pp team
        puts
      end
    elsif filter_input == "1"
      puts "Please enter an ID to select. Refer to Option 0 for reference."
      singular_team_input = gets.chomp.to_i
      response = HTTP.get("http://localhost:3000/api/sport_teams/#{singular_team_input}")
      singularity = response.parse(@sport_team)

      puts
      pp singularity
      puts
    elsif filter_input == "2"
      puts "Please enter city/region to filter by:"
      city_filter_response = gets.chomp
      all_teams.each do |team|
        if team["geographic_affiliation"] == city_filter_response
          puts
          pp team
          puts
        end
      end
    elsif filter_input == "3"
      puts "Filter by Large, Medium or Small markets:"
      market_filter_response = gets.chomp

      all_teams.each do |team|
        if team["market_size"] == market_filter_response
          puts
          pp team
          puts
        end
      end
    else
      puts "Invalid Input! Exiting Program..."
      break
    end
  elsif user_input == "3"
    puts "What item do you want to alter?"
    update_input = gets.chomp.to_i
    puts "What atrribute do you want to change?"
    update_input_2 = gets.chomp.to_sym
    puts "What do you want the value to be?"
    update_input_3 = gets.chomp

    response = HTTP.patch("http://localhost:3000/api/sport_teams/#{update_input}", :params => {update_input_2 => update_input_3})
  elsif user_input == "4"
    puts "Please enter ID of team you wish to Destroy:"
    destroy_input = gets.chomp.to_i
    response = HTTP.delete("http://localhost:3000/api/sport_teams/#{destroy_input}")
  else
    puts "Invalid input. Exiting program..."
    break
  end
end