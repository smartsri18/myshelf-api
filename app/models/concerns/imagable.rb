module Imagable
  extend ActiveSupport::Concern
  included do
    has_many :images, as: :imagable
  end
end