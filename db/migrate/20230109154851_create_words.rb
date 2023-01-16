class CreateWords < ActiveRecord::Migration[5.2]
  def change
    create_table :words do |t|
      t.string :eng_word
      t.string :ua_word

      t.timestamps
    end
  end
end
