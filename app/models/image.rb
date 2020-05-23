class Image < ApplicationRecord
  belongs_to :imagable, polymorphic: true
end
