# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

@admin =  User.create!(email:"admin@3rdopinion.com", password:"admin@123", admin:true)
@category1 = Category.create!(name:"Health")
@category2 = Category.create!(name:"Technologies")
@category3 = Category.create!(name:"Automobile")
@category4 = Category.create!(name:"Travel")
@category5 = Category.create!(name:"Home & Interior Decor")
