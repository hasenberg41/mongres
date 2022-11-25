# frozen_string_literal: true

class Contract < ApplicationRecord
  belongs_to :person
  belongs_to :document
end
