class AddWebsiteToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :website, index: true, foreign_key: true
  end
end
