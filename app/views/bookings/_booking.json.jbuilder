json.extract! booking, :id, :customer_email, :cleaner_email, :customer_id, :cleaner_id, :created_at, :updated_at
json.url booking_url(booking, format: :json)
