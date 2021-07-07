class CreateRequestInformations < ActiveRecord::Migration[6.1]
  def change
    create_table :request_informations do |t|
      t.string :client_ip
      t.string :path
      t.string :status_code

      t.timestamps
    end
  end
end
