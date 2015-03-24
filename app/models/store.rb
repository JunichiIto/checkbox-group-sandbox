class Store < ActiveRecord::Base
  FACILITY_OPTIONS = { 'parking' => '駐車場あり', 'private_room' => '個室あり', 'card_ok' => 'クレジットカード可' }
  serialize :facilities, Array

  def selected_facility_options_text
    selected_facility_options.join(', ')
  end

  private

  before_save :reject_empty_facility_options!
  def reject_empty_facility_options!
    # hiddenタグによって生成される空文字のcodeを除去する
    facilities.reject!(&:empty?)
  end

  def selected_facility_options
    FACILITY_OPTIONS.slice(*facilities).values
  end
end
