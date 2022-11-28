# frozen_string_literal: true

module Api
  class DocumentsController < ApplicationController
    def create
      document = Document.new(document_params)

      if document.valid?
        document.save
        render json: Document.find_by(document_params).to_json, status: :created
      else
        render status: :unprocessable_entity
      end
    end

    def index
      render json: Document.all.map(&:to_json)
    end

    def destroy
      Document.find(params[:id]).destroy!

      render :no_content
    rescue ActiveRecord::RecordNotFound
      render status: :unprocessable_entity
    end

    private

    def document_params
      params.permit(:name, :description, :link_to_data)
    end
  end
end
