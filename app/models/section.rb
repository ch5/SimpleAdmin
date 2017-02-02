# == Schema Information
#
# Table name: sections
#
#  id           :integer          not null, primary key
#  page_id      :integer
#  name         :string
#  position     :integer
#  visible      :boolean          default("f")
#  content_type :string
#  content      :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_sections_on_page_id  (page_id)
#

class Section < ApplicationRecord
  belongs_to :page
  has_many :section_edits
  has_many :admin_users, :through => :section_edits

  scope :visible,lambda { where(:visible => true)}
  scope :invisible, lambda { where(:visible => false)}
  scope :sorted, lambda { order(:position => :asc )}
  scope :newest_first, lambda{ order(:position => :desc )}

  CONTENT_TYPES = ['text', 'HTML']
  validates_presence_of :name
  validates_length_of :name, :maximum => 30
  validates_inclusion_of :content_type, :in => ['text', 'HTML'],
        :messages => "musb be one of: #{CONTENT_TYPES.join(', ')}"
  validates_presence_of :content
end
