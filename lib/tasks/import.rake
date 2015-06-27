require 'csv'
namespace :import do

     task users: :environment do
        filename=File.join Rails.root, "users.csv"
        counter=0; 
 	CSV.foreach(filename) do |row|
    
         id, username, email, encrypted_password, dummy1,dummy2,dummy3,dummy4,sign_in_count,dummy5,dummy6,current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, fname, active= row                 
	 puts email
          user= User.create(id: id, username: username, email: email , encrypted_password: encrypted_password,password_salt: dummy1,
sign_in_count: sign_in_count,current_sign_in_at: current_sign_in_at, last_sign_in_at: last_sign_in_at, current_sign_in_ip: current_sign_in_ip, last_sign_in_ip: last_sign_in_ip, created_at: created_at, updated_at: updated_at, fname: fname, active: active)	 
         puts "#{user.errors.full_messages.join(",")}" if user.errors.any?
         counter+=1 if user.persisted?
         end
        puts counter
     end

end
