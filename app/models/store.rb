class Store < ActiveRecord::Base
  FACILITY_OPTIONS = {'1' => :parking, '2' => :private_room, '3' => :card_ok}
  serialize :facilities, Array

  before_save :remove_blank_facility_option
  def remove_blank_facility_option
    # hiddenタグによって生成される空文字のcodeを除去する
    self.facilities = self.facilities.select(&:present?)
  end

  def selected_facility_options
    FACILITY_OPTIONS.slice(*self.facilities).values
  end

  def selected_facility_options_text
    selected_facility_options.join(', ')
  end
end
