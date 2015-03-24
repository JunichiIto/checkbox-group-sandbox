class Store < ActiveRecord::Base
  FACILITY_OPTIONS = {'1' => :parking, '2' => :private_room, '3' => :card_ok}
  serialize :facilities, Array
end
