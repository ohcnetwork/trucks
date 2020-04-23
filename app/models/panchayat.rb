# frozen_string_literal: true

class Panchayat < ApplicationRecord
  has_many :users

  belongs_to :district
end
