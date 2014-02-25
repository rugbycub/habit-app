module CompletionsHelper
  def completed?(completions, date)
    completions.each do |completion|
      if completion.date.day == date.day && completion.date.month == date.month && completion.date.year == date.year
        return true
      end
    end
    false
  end
end
