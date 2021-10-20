class Reservation < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :room
  belongs_to :user
  has_many :daytimes

  validates :day, :time, :end_time, :group_name, :manager, :phone_number, :people_number, :use, presence: true

  validates :room_id, numericality: { other_than: 1 , message: "Please select one"} 


end
