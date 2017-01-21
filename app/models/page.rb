class Page < ApplicationRecord

  belongs_to :subject
  has_and_belongs_to_many :admin_users

  scope :visible,lambda { where(:visible => true)}
  scope :invisible, lambda { where(:visible => false)}
  scope :sorted, lambda { order(:position => :asc )}
  scope :newest_first, lambda{ order(:position => :desc )}
  scope :search, lambda { |query| where(["name LIKE ?"], "%#{query}%")}

  validates_presences_of :name
  validates_length_of :name, :maximum => 30
  validates_presences_of :permalink
  validates_length_of :permalink, :minimum => 10
  validates_uniqueness :permalink

end
