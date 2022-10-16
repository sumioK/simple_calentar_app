class Reservationc < ApplicationRecord
  validates :name, presence: true
  validate :date_before_start
  validate :date_is_today
  validate :start_time_not_sunday_saturday
  validate :time_only
  validates :start_time, uniqueness: {message: 'はほかのユーザーが予約しています'}



  def date_before_start
    if start_time < Date.today
      errors.add(:start_time, "は過去の日付を選択できません")
    end
  end

  def date_is_today
    if start_time == Date.today
      errors.add(:start_time, "は当日の予約は電話にてお願いします")
    end
  end

  def start_time_not_sunday_saturday
    if start_time.sunday? || start_time.saturday?
      errors.add(:start_time, "土・日は定休日とさせていただいております")
    end
  end

  def time_only
    start_time.min == 00
  end


end