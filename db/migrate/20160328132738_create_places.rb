class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
    	t.string  :name
    	t.string  :description
    	t.string  :address
    	t.integer :capacity
    	t.date    :date_opened
    	t.string  :image_url

      t.timestamps null: false
    end
  end
end
