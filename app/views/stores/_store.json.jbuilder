json.extract! store, :id, :user_id, :name, :description, :main_image, :start_biz_hours, :end_biz_hours, :clock_in_time, :created_at, :updated_at
json.url store_url(store, format: :json)