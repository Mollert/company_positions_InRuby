#Company Positions
#David Mollert
class CompanyPositions

  attr_accessor :positions

  def initialize
    @@positions = ["Account", "Buyer", "Clerk", "Maintenance", "Manager", "Receptionist", "Receiving", "Salesperson"]
  end

  def display
    @@positions.each do |position|
    puts position
    end
  end

  def display_with_numbers
    num = 1
    @@positions.each do |position|
    puts "#{num}.  #{position}"
    num += 1
    end
  end

  def add_to(add)
    @@positions.push(add)
  end

  def subtract_from(del)
    @@positions.delete(del)
  end

  def subtract_from_positions(remove)
    remove = remove.to_i
    remove -= 1
    @@positions.delete_at(remove)
  end

  def if_exists(pos)
    if @@positions.include?(pos) == true
      puts "Yes, #{(pos)} does exist in your company."
    else
      puts "No, #{(pos)} does not exist in your company."
    end
  end
  #def change_num(number_of_employes)
  #end
end
