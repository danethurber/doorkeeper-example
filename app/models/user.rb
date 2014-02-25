# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first_name      :string(255)
#  last_name       :string(255)
#  email           :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  password_digest :string(255)
#

class User < ActiveRecord::Base
  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  before_validation :downcase_email!, :strip_email!


  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  validates :password, length: { minimum: 6 }, if: :should_validate_password?
  validates_confirmation_of :password, if: :should_validate_password?




  protected
  def downcase_email!
    self.email.downcase! if email.present?
  end

  def strip_email!
    self.email.strip! if email.present?
  end

  def should_validate_password?
    new_record? || password.present?
  end
end
