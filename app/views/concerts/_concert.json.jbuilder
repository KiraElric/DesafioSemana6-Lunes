json.extract! concert, :id, :attendance, :duration, :date, :band_id, :created_at, :updated_at
json.url concert_url(concert, format: :json)
