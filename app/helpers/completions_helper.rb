module CompletionsHelper
  def completed?(completions, date)
    completions.each do |completion|
      if completion.date.day == date.day
        return true
      end
    end
    false
  end
end
