class ClientHasFubId < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :follow_up_boss_id, :integer
  end
end
