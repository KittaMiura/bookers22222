class RemoveTextFromBooks < ActiveRecord::Migration[6.1]
  def change
    remove_column :books, :text, :text
  end
end
