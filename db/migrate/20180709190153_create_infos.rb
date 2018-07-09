class CreateInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :infos do |t|
      t.string :attachment
      t.string :attachment_dir
      t.text :content
      
      t.timestamps
    end
  end
end
