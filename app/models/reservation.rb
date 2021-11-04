class Reservation < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :room
  belongs_to :user
  has_many :looks
  has_many :looked_users, through: :looks, source: :user

  with_options presence: true do
    validates :day
    validates :time
    validates :end_time
    validates :group_name
    validates :manager, on: :update
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'は半角数字で入力してください' }, on: :update
    validates :people_number, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 200, message: 'は1〜200人以内で入力してください' }, format: { with: /\A[0-9]+\z/ },  on: :update
    validates :use, on: :update
  end

  validate :day_check
  validate :end_time_check, if: -> { validation_context == :check }
  validate :room_check, if: -> { validation_context == :check }

  validates :room_id, numericality: { other_than: 1 , message: "を選択してください"} 


def day_check
  return if self.day.blank?
    errors.add(:day, "の日付を正しく入力してください") if self.day < Date.current
end

def end_time_check
  return if self.end_time.blank?
    errors.add(:end_time, "を正しく入力してください") if self.end_time < self.time
end

def room_check
      if Reservation
        .where(day: self.day)
        .where(room_id: self.room_id)
        .where('finish_time > ?', self.start_time)
        .where('start_time < ?', self.finish_time)
        .where.not(id: id).exists?
        errors.add(:base, "予約が重複しています") 
      end
end
end
