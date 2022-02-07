json.extract! record, :id, :name, :ammount, :created_at, :updated_at
json.url record_url(record, format: :json)
