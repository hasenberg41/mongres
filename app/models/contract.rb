# frozen_string_literal: true

class Contract < ApplicationRecord
  belongs_to :person, optional: true
  belongs_to :document, optional: true

  validates :title, presence: true
end
