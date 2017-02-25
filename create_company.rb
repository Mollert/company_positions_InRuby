#Create Company
#David Mollert

require_relative "company_positions"
require_relative "number_of_positions"

puts "Let me help you staff your company.  What is your company called?"
company_name = gets.chomp
company_name_display = company_name
puts "OK, let\'s start by looking over a selection of positions."
#company_name = CompanyPositions.new
company_name = NumberOfPositions.new
company_name.display_with_numbers
puts "Is there a position that doesn\'t fit your company and you would like to delete (y/n)?"
yesno = gets.chomp.capitalize
if yesno == "Y" || yesno =="Yes"
  puts "Pick a number from the list of positions and hit the return."
  num = gets.chomp
  while num != ""
    company_name.subtract_from_positions(num)
    company_name.display_with_numbers
    puts "Type in another number or hit a return."
    num = gets.chomp
  end
end
puts "Now, are there positions you would like to add (y/n)?"
yesno = gets.chomp.capitalize
if yesno == "Y" || yesno =="Yes"
  puts "Type in the position you would like to add.  When complete hit another return."
  newpos = gets.chomp.capitalize
  while newpos != ""
    company_name.add_to(newpos)
    company_name.display_with_numbers
    puts "Type in another position or hit a return."
    newpos = gets.chomp.capitalize
  end
end
puts "Your company \"#{company_name_display}\" consists of the following positions."
company_name.display_with_numbers
puts "\n"
puts "Let\'s put a quantity to each position."
puts "I\'ll present each position to you and you can add the quantity."
company_name_hash = Hash.new
company_name_array = Array.new
pos_num = 1
entered_qty = 0
while pos_num <= company_name.how_many_positions(company_name)
  company_name.show_each(pos_num, company_name)
  entered_qty = gets.chomp.to_i
  company_name.add_quantity_to_position(entered_qty, pos_num, company_name, company_name_hash)
  company_name_array.push(entered_qty)
  pos_num += 1
end
puts "\n"
company_name.line_up_quantity(company_name_hash, company_name_array)
company_name.display_formated(company_name_display, company_name_hash)
puts "\n"
