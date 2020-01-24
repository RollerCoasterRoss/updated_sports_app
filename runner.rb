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
    puts "Enter team name now:"
    create_input_1 = gets.chomp
    puts "Enter city or region that team represents:"
    create_input_2 = gets.chomp
    puts "Enter team market size now:"
    create_input_3 = gets.chomp
    puts "Enter fanbase loyalty rating now:"
    create_input_4 = gets.chomp
    puts "Enter type of sport team plays:"
    create_input_5 = gets.chomp
    puts "Enter well known player now:"
    create_input_6 = gets.chomp
    puts "Enter any additional comments now:"
    create_input_7 = gets.chomp

    response = HTTP.post("http://localhost:3000/api/sport_teams", :params => {team_name: create_input_1, city_region: create_input_2, market_size: create_input_3, fanbase_loyalty: create_input_4, sport_type: create_input_5, notable_player: create_input_6, additional_info: create_input_7})
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
      pp all_teams
    elsif filter_input == "1"
    elsif filter_input == "2"
    elsif filter_input == "3"
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