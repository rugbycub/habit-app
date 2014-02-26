module HabitsHelper

def get_freq(freq, my_date)
  month_size = Time.days_in_month(my_date.month, my_date.year)
  month_size < freq ? month_size : freq
end

def days_of_week
  ["Su", "M", "Tu", "W", "Th", "F", "Sa"]
end

end
