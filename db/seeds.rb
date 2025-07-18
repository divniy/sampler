# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# User.find_or_initialize_by(email_address: 'divniy@gmail.com').update!(password: Rails.application.credentials.divniy_password)
divniy = Rails.application.credentials.users.divniy
User.create_with(divniy.slice(:password)).find_or_create_by!(divniy.slice(:email_address))
