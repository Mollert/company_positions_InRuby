#Create Company
#David Mollert

require_relative "company_positions"

class NumberOfPositions < CompanyPositions

  def initialize
    super
  end

  def show_each(item, position)
    item -= 1
    puts @@positions[item]
  end

  def how_many_positions(position)
    @@positions.length
  end

  def add_quantity_to_position(number, item, position, temphash)
    item -= 1
    temphash[@@positions[item]] = number
  end

  def line_up_quantity(rehash, catcharryv)
    hashexchange = {}
    hashexchange.update(rehash)
    rehash.clear
    catcharryv.sort!
    catcharryv.sort! {|x, y| y <=> x}
    lngh = catcharryv.length
    i = 0
    while i < lngh do
      arryelement = catcharryv[i]
      hashelement = hashexchange.key(catcharryv[i])
      hashexchange.delete(hashelement)
      rehash.store(hashelement, arryelement)
      i += 1
    end
    i = 0
    numatch = 0
    multpr = 0
    while i < lngh do
      if catcharryv[i] == catcharryv[i+1]
        numatch += 1
      end
      if numatch > multpr
        multpr = numatch
      end
      if catcharryv[i] != catcharryv[i+1]
        numatch = 0
      end
      i += 1
    end
    n = 0
    tempkey = " "
    catcharryk = rehash.keys
    while n <= multpr do
      l = 0
      i = 0
      while l < lngh do
        if catcharryv[i] == catcharryv[i+1]
          if "#{catcharryk[i]}" > "#{catcharryk[i+1]}"
            tempkey = catcharryk[i]
            catcharryk[i] = catcharryk[i+1]
            catcharryk[i+1] = tempkey
          end
        end
        i += 1
        l += 1
      end
      n += 1
    end
    rehash.clear
    i = 0
    while i < lngh do
      rehash[catcharryk[i]] = catcharryv[i]
      i += 1
    end
  end

  def display_formated(compname, finalhash)
    lineWidth = 30
    puts "#{compname}".center(lineWidth)
    puts "===   Positions   ===".center(lineWidth)
    finalhash.each do |key, value|
      puts "  #{key}:".ljust(lineWidth/2) + "#{value}  ".rjust(lineWidth/2)
    end
  end
end
