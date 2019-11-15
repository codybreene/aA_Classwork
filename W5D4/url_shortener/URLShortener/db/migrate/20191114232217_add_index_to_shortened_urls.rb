class AddIndexToShortenedUrls < ActiveRecord::Migration[5.2]
  def change
    add_index :shortened_urls, [:short_url, :long_url], uniqueness: true
  end
end
