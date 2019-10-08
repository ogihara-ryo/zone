class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.belongs_to :user, index: true
      t.string :title, default: false, null: false
      t.boolean :finished, default: false, null: false

      t.timestamps
    end
  end
end
