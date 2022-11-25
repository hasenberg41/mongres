# frozen_string_literal: true

module Api
  class PeopleController < ApplicationController
    def create
      person = Person.new(person_params)

      if person.save
        render json: person.to_json, status: :created
      else
        render json: person.errors.full_messages, status: :unprocessable_entity
      end
    end

    def index
      render json: Person.all.map(&:to_json)
    end

    def destroy
      Person.find(params[:id]).destroy!

      render :no_content
    rescue ActiveRecord::RecordNotFound
      render status: :unprocessable_entity
    end

    private

    def person_params
      params.require(:person).permit(:name)
    end
  end
end
