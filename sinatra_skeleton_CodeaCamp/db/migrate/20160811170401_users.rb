class Users < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string    :name,  nul: false
      t.string    :email, nul: false
      #has_secure_password
      #Adds methods to set and authenticate against a BCrypt password.
      #This mechanism requires you to hace a << password_digest >> attribute
      t.string    :password_digest, nul: false 

    end
  end
end
