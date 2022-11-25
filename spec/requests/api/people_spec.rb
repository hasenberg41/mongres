# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'api/people', type: :request do
  path '/api/people' do
    get('list people') do
      tags 'People'

      consumes 'application/json'
      produces 'application/json'

      response(200, 'successful') do
        schema type: :array, properties: {
          id: { type: :integer },
          name: { type: :string }
        }

        let!(:person) { Person.create!(name: 'Prohar') }
        run_test! do
          expect(person.name).to eq Person.find(person.id).name
        end
      end
    end

    post('create person') do
      tags 'People'

      consumes 'application/json'
      produces 'application/json'

      parameter name: :data, in: :body, schema: {
        type: :object, properties: {
          name: { type: :string }
        }, required: :name
      }

      response(201, 'created') do
        schema type: :object, properties: {
          id: { type: :integer },
          name: { type: :string }
        }

        let(:data) { { name: 'Dark Sous' } }

        run_test! do |response|
          data = JSON.parse(response.body)
          expect(response['name']).to eq data[:name]
        end
      end
    end
  end

  path '/api/people/{id}' do
    delete('delete person') do
      tags 'People'

      consumes 'application/json'
      produces 'application/json'

      parameter name: :id, in: :path, type: :string, description: 'id'

      response(200, 'successful') do
        let(:person) { Person.create(name: 'Eric Cartman') }
        let(:id) { person.id }

        run_test! do
          expect { Person.find(id) }.to raise_error ActiveRecord::RecordNotFound
        end
      end
    end
  end
end
