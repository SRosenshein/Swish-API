class Court < ApplicationRecord
    geocoded_by :address
    after_validation :geocode, if: ->(obj){ !obj.latitude.present? or obj.address_changed? }
end
