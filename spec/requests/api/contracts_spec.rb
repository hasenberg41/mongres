# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'api/contracts', type: :request do
  let(:document) { Document.first }
  let(:person) { Person.create(name: 'Devil') }

  path '/api/contracts' do
    get('list contracts') do
      tags 'Contracts'

      consumes 'application/json'
      produces 'application/json'

      response(200, 'successful') do
        schema type: :array, properties: {
          id: { type: :integer },
          title: { type: :string },
          people_id: { type: :integer },
          contracts_id: { type: :integer }
        }

        let!(:contract) { Contract.create!(title: 'deal with devil', documents_id: document.id, people_id: person.id) }

        run_test! do
          expect(contract.title).to eq Contract.find(contract.id).title
        end
      end
    end

    post('create contract') do
      tags 'Contracts'

      consumes 'application/json'
      produces 'application/json'

      parameter name: :data, in: :body, schema: {
        type: :object, properties: {
          title: { type: :string },
          people_id: { type: :integer },
          contracts_id: { type: :integer }
        }, required: %i[title people_id contracts_id]
      }

      response(201, 'created') do
        schema type: :object, properties: {
          id: { type: :integer },
          title: { type: :string },
          people_id: { type: :integer },
          contracts_id: { type: :integer }
        }

        let(:data) { { title: 'deal with devil', people_id: person.id, documents_id: document.id } }

        run_test! do |response|
          data = JSON.parse(response.body)
          expect(response['title']).to eq data[:title]
          expect(response['people_id']).to eq data[:people_id]
          expect(response['documents_id']).to eq data[:documents_id]
        end
      end

      response 422, 'bad params' do
        let(:data) { {} }
      end
    end
  end

  path '/api/contracts/{id}' do
    delete('delete person') do
      tags 'Contracts'

      consumes 'application/json'
      produces 'application/json'

      parameter name: :id, in: :path, type: :string, description: 'id'

      response(200, 'successful') do
        let(:contract) { Contract.create!(title: 'deal with devil', documents_id: document.id, people_id: person.id) }
        let(:id) { contract.id }

        run_test! do
          expect { Contract.find(id) }.to raise_error ActiveRecord::RecordNotFound
        end
      end
    end
  end
end
