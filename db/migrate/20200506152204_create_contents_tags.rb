class CreateContentsTags < ActiveRecord::Migration[6.0]
  def change
    create_table :contents_tags do |t|
      t.references :content, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
