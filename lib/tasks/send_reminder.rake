desc "Texts users who have reminders turned on"
  # Set the custom rake up for scanning reservations.
  task :text_users => :environment do

    User.all.each do |user|
      
      if user.profile != nil
        profile = user.profile
        if profile.reminders == true
          number = "+1#{user.phone_number.gsub(/\D/, '').to_s}"
          twilioText(user,number)
        end    
      end    
    end
  end

  def twilioText(user, number)

    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
    
    #format time information, store as ft


    @client.account.sms.messages.create(
      :body => message = "Hello #{user.first_name}. You have things to do! Visit http://bit.ly/1kagP7f to update your progress",
      :to => number,
      :from => ENV['TWILIO_PHONE_NUMBER']) 

  end

