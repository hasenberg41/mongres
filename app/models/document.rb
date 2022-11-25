# frozen_string_literal: true

class Document < ApplicationRecord
  self.primary_key = 'id'

  has_many :contracts
  has_many :people, through: :contracts
end
