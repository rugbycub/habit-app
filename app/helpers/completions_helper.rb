module CompletionsHelper
  def completed?(completions, date)
    completions.each do |completion|
      if completion.date == date
        return true
      end
    end
    false
  end
end
