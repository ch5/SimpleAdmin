class Page < ApplicationRecord

  belongs_to :subject
  has_and_belongs_to_many :admin_users

  scope :visible,lambda { where(:visible => true)}
  scope :invisible, lambda { where(:visible => false)}
  scope :sorted, lambda { order(:position => :asc )}
  scope :newest_first, lambda{ order(:position => :desc )}
  scope :search, lambda { |query| where(["name LIKE ?"], "%#{query}%")}

end
