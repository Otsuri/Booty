class CreateTtags < ActiveRecord::Migration[6.0]
  def change
    create_table :ttags do |t|
      t.string :name

      t.timestamps
    end
  end
end
