# frozen_string_literal: true
class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :vehicle
  belongs_to :state
  attr_accessor :vehicle_number
  enum status: { entry: "entry", exit: "exit" }
end
