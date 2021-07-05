class CreateRequestControls < ActiveRecord::Migration[6.1]
  def change
    create_table :request_controls do |t|
      t.string :remote_ip
      t.integer :max_request_origin_ip
      t.string :destination_path
      t.string :email
      t.string :token
      t.string :acceptance_criteria

      t.timestamps
    end
  end
end
