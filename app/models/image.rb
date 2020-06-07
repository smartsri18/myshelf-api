# == Schema Information
#
# Table name: images
#
#  id            :integer          not null, primary key
#  imagable_type :string           not null
#  imagable_id   :integer          not null
#  image_url     :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Image < ApplicationRecord
  belongs_to :imagable, polymorphic: true
end
