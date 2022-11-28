# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'api/documents', type: :request do
  path '/api/documents' do
    get('list documents') do
      tags 'Documents'

      consumes 'application/json'
      produces 'application/json'

      response(200, 'successful') do
        schema type: :array, properties: {
          id: { type: :integer },
          name: { type: :string },
          description: { type: :string },
          link_to_data: { type: :string }
        }

        let!(:document) { Document.create!(name: 'nda', description: 'shut up)', link_to_data: 'pipipupu.check') }

        run_test! do
          expect(document.name).to eq Document.find(document.id).name
        end
      end
    end

    post('create document') do
      tags 'Documents'

      consumes 'application/json'
      produces 'application/json'

      parameter name: :data, in: :body, schema: {
        type: :object, properties: {
          name: { type: :string },
          description: { type: :string },
          link_to_data: { type: :string }
        }, required: %i[name description link_to_data]
      }

      response(201, 'created') do
        schema type: :object, properties: {
          id: { type: :integer },
          name: { type: :string },
          description: { type: :string },
          link_to_data: { type: :string }
        }

        let(:data) { { name: 'Dark Sous', description: 'shut up)', link_to_data: 'pipipupu.check' } }

        run_test! do |response|
          data = JSON.parse(response.body)
          expect(response['name']).to eq data[:name]
          expect(response['description']).to eq data[:description]
          expect(response['link_to_data']).to eq data[:link_to_data]
        end
      end

      response 422, 'bad params' do
        let(:data) { {} }
      end
    end
  end

  path '/api/documents/{id}' do
    delete('delete person') do
      tags 'Documents'

      consumes 'application/json'
      produces 'application/json'

      parameter name: :id, in: :path, type: :string, description: 'id'

      response(200, 'successful') do
        let!(:document) { Document.create!(name: 'Dark Sous', description: 'shut up)', link_to_data: 'pipipupu.check') }
        let(:id) { document.id }

        run_test! do
          expect { Document.find(id) }.to raise_error ActiveRecord::RecordNotFound
        end
      end
    end
  end
end
