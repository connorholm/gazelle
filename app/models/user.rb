class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable
  
  def after_confirmation
    # send welcome email
    WelcomeMailer.send_greetings_notification(self).deliver_now
  end
end
