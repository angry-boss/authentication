class CreateAuthenticationSessions < ActiveRecord::Migration[5.2]
    def change
      create_table :authentication_sessions do |t|
          t.string :token, :browser_id
          t.index :token, :length => 10
          t.integer :user_id
          t.boolean :active, :default => true
          t.text :data
          t.datetime :expires_at
          t.datetime :login_at
          t.string :login_ip
          t.datetime :last_activity_at
          t.string :last_activity_ip, :last_activity_path
          t.string :user_agent
          t.string :user_type
          t.integer :parent_id
          t.string :host
          t.string :token_hash
          t.integer :requests, :default => 0
          t.datetime :password_seen_at
          t.index :token_hash, :length => 10
          t.index :user_id
          t.index :browser_id, :length => 10
          t.datetime :two_factored_at
          t.string :two_factored_ip

          t.timestamps :null => true
      end
    end
  end
