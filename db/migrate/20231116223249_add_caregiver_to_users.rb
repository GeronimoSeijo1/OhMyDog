class AddCaregiverToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :caregiver, foreign_key: true
  end
end
