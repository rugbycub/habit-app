class Message < ActiveRecord::Base
  belongs_to :user, :foreign_key => "receiver_id",
                    :class_name  => "User"

  belongs_to :sender, :foreign_key => "sender_id",
                      :class_name  => "User"
end
