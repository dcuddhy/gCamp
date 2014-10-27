require 'date'

date1 = Date.new(2014,3,3)

date2 = nil

@dates = [date1, date2]

# ---------------------

@dates.each do |date|

  if date == nil
    puts ''
  else
    puts date.strftime("%m/%d/%Y")
  end

end
