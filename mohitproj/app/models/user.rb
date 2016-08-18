class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :website

  after_create :assign_website

  def assign_website
    # add website association to user
    website = Website.order("RANDOM()").first
    website.users << self
    website.save!

    # email website link to the user
    UserMailer.assign_website(self).deliver_now
  end
end
