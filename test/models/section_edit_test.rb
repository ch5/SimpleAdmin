# == Schema Information
#
# Table name: section_edits
#
#  id            :integer          not null, primary key
#  admin_user_id :integer
#  section_id    :integer
#  summary       :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_section_edits_on_admin_user_id_and_section_id  (admin_user_id,section_id)
#

require 'test_helper'

class SectionEditTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
