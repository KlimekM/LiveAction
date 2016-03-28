class CreateCheckins < ActiveRecord::Migration
  def change
    create_table :checkins do |t|
    	t.references :user
    	t.references :place
    	t.string     :image_url
    	t.date       :date_attended

      t.timestamps null: false
    end
  end
end
