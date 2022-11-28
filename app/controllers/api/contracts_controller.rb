# frozen_string_literal: true

module Api
  class ContractsController < ApplicationController
    def create
      contract = Contract.new(contract_params)

      if contract.save
        render json: contract.to_json, status: :created
      else
        render json: contract.errors.full_messages, status: :unprocessable_entity
      end
    end

    def index
      render json: Contract.all.map(&:to_json)
    end

    def destroy
      Contract.find(params[:id]).destroy!

      render :no_content
    rescue ActiveRecord::RecordNotFound
      render status: :unprocessable_entity
    end

    private

    def contract_params
      params.require(:contract).permit(:title, :people_id, :documents_id)
    end
  end
end
