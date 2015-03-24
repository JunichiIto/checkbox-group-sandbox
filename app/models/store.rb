class Store < ActiveRecord::Base
  FACILITY_OPTIONS = {'1' => :parking, '2' => :private_room, '3' => :card_ok}
  serialize :facilities, Array

  before_save :remove_blank_facility_option
  def remove_blank_facility_option
    self.facilities = self.facilities.select(&:present?)
  end
end
