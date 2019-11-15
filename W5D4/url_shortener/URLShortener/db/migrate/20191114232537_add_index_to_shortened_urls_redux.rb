class AddIndexToShortenedUrlsRedux < ActiveRecord::Migration[5.2]
  def change
    add_index :shortened_urls, [:long_url, :short_url], unique: true
  end
end
