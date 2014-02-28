desc "Texts users who have reminders turned on"
  # Set the custom rake up for scanning reservations.
  task :text_users => :environment do

    User.all.each do |user|
      
      if user.profile != nil
        profile = user.profile
        if profile.reminders == true
          if user.phone_number != nil
            number = "+1#{user.phone_number.gsub(/\D/, '').to_s}"
            if user.habits.count == 0
              message = "Hello #{user.first_name}. You don't have any active habits on Wooo! Visit http://bit.ly/1kagP7f to set some up!"
              twilio_text(user, number, message)
            else
              total_habits = user.habits.count
              weekly_completions = []
              completions_goal = []
              user.habits.each do |habit|
                weekly_completions << habit.this_weeks_completions.count
                completions_goal << habit.frequency
              end
              wc = weekly_completions.inject{|sum, x| sum + x}
              cg = completions_goal.inject{|sum, x| sum + x }
              remaining_completions = cg - wc
              if remaining_completions >= completions_goal
                message = "Hello #{user.first_name}.  You have #{remaining_completions} left on your #{total_habits} habits.  Visit http://bit.ly/1kagP7f to update"
                twilio_text(user, number, message)
              else
                message = "Congratulations #{user.first_name}! You have completed all your tasks for the week.  Add more at http://bit.ly/1kagP7f"
              end
            end
          end  
        end  
      end    
    end
  end

  def twilio_text(user, number, user_message)

    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
    
    #format time information, store as ft


    @client.account.sms.messages.create(
      :body => message = user_message,
      :to => number,
      :from => ENV['TWILIO_PHONE_NUMBER']) 

  end

