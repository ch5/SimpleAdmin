class AdminUser < ApplicationRecord
  has_and_belongs_to_many :pages

  has_secure_password

  has_many :section_edits

  has_many :sections, :through => :section_edits

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  FORBIDEN_USERNAMES = ['littlebopeep', 'humptydumpty', 'marymary']

  # validates_presence_of :first_name
  # validates_format_of :email, :with => EMAIL_REGEX
  # validates_confirmation_of :email

  validates :first_name, :presence => true,
                        :length => { :maximum => 25}
  validates :last_name, :presence => true,
                        :length => { :maximum => 50}
  validates :username, :length => { :within => 8..25},
                       :uniqueness => true
  validates :email, :presence => true,
                    :length => { :maximum => 100},
                    :format => EMAIL_REGEX,
                    :confirmation => true

  validate :username_is_allowed

  scope :sorted, lambda { order(:last_name => :asc, :first_name => :asc)}

  def name
    "#{first_name} #{last_name}"
  end

  private

  def username_is_allowed
    if FORBIDEN_USERNAMES.include?(username)
      errors.add(:username, "has been restricted from use.")
    end
  end
end
