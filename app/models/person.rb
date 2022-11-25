# frozen_string_literal: true

class Person < ApplicationRecord
  has_many :contracts
  has_many :documents, through: :contracts

  validates :name, presence: true
end
