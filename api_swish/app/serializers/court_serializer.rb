class CourtSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :status, :address, :latitude, :longitude
end
