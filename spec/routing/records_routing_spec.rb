require 'rails_helper'

RSpec.describe RecordsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: 'categories/1/records').to route_to(
        controller: 'records',
        action: 'index',
        category_id: '1'
      )
    end

    it 'routes to #new' do
      expect(get: 'categories/1/records/new').to route_to(
        controller: 'records',
        action: 'new',
        category_id: '1'
      )
    end

    it 'routes to #show' do
      expect(get: 'categories/1/records/2').to route_to('records#show', category_id: '1', id: '2')
    end

    it 'routes to #edit' do
      expect(get: '/categories/1/records/2/edit').to route_to('records#edit', category_id: '1', id: '2')
    end

    it 'routes to #create' do
      expect(post: '/categories/1/records').to route_to('records#create', category_id: '1')
    end

    it 'routes to #update via PUT' do
      expect(put: '/categories/2/records/1').to route_to('records#update', category_id: '2', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/categories/2/records/1').to route_to('records#update', category_id: '2', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/categories/2/records/1').to route_to('records#destroy', category_id: '2', id: '1')
    end
  end
end
