require 'twilio-ruby'
require 'iron_worker_ng'


@account_sid = ENV['TWILIO_ACCOUNT_SID']
@auth_token = ENV['b95f27e045d1204732a5945352950e39']
@project_id = ENV['530e4c7bce463a000900004d']
@token = ENV['rexFJ2nlbv_uBmZLDrroFlbM-nk']
number = "+1#{current_user.phone_number.gsub(/\D/, '').to_s}"


twilio = Twilio::REST::Client.new @account_sid, @auth_token
ironcache = IronWorkerNG::Client.new(:project_id => @project_id, :token => @token)


puts "Found number #{number}"

cache = ironcache.cache("habits-#{number}")

day = cache.get("day")

next_habit = cache.get(day.value.to_s).value

message = "Hello #{current_user.first_name}. You have things to do! Visit http://bit.ly/1kagP7f to update your progress"

twilio.account.sms.messages.create(
  :from => ENV['TWILIO_PHONE_NUMBER'],
  :to => number,
  :body => message
)