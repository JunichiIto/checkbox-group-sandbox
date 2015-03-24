class Store < ActiveRecord::Base
  FACILITY_OPTIONS = {'1' => :parking, '2' => :private_room, '3' => :card_ok}
  serialize :facilities, Array

  before_save :reject_empty_facility_options!
  def reject_empty_facility_options!
    # hiddenタグによって生成される空文字のcodeを除去する
    facilities.reject!(&:empty?)
  end

  def selected_facility_options
    FACILITY_OPTIONS.slice(*facilities).values
  end

  def selected_facility_options_text
    selected_facility_options.join(', ')
  end
end
