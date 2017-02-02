# == Schema Information
#
# Table name: subjects
#
#  id         :integer          not null, primary key
#  name       :string
#  position   :integer
#  visible    :boolean          default("f")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Subject < ApplicationRecord

  has_many :pages

  scope :visible,lambda { where(:visible => true)}
  scope :invisible, lambda { where(:visible => false)}
  scope :sorted, lambda { order(:position => :asc )}
  scope :newest_first, lambda{ order(:position => :desc )}
  scope :search, lambda { |query| where(["name LIKE ?"], "%#{query}%")}

  validates_presence_of :name
end
