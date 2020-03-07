class InterestPlaceSerializer < ActiveModel::Serializer
  attributes :name, :x, :y, :opened, :closed
end
