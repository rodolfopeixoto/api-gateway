class AddPeriodSecondsToRequestControls < ActiveRecord::Migration[6.1]
  def change
    add_column :request_controls, :period_seconds, :integer, default: 1
  end
end
