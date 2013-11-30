class CreateUsersRoles < ActiveRecord::Migration
  def change
    create_table(:users_roles, :id => false) do |t|
      t.references :user
      t.references :role
      t.timestamps
    end
    add_index(:users_roles, [ :user_id, :role_id ])
  end
end
