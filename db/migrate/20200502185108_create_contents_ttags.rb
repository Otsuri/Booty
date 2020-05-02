class CreateContentsTtags < ActiveRecord::Migration[6.0]
  def change
    create_table :contents_ttags do |t|
      t.references :contents, null: false, foreign_key: true
      t.references :ttags, null: false, foreign_key: true

      t.timestamps
    end
  end
end
