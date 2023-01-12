# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

richi = User.create!(name: 'Ricardo Rojas', email: 'reddrum7@gmail.com', password: '12345678')

bruma = Product.create!(name: 'Bruma', description: 'Ideal para el sueno', cost_price: '8.000', sale_price: '12.000')
rollonMenta = Product.create!(name: 'Roll on Menta', description: 'Ideal para el dolor de cabeza', cost_price: '10.000', sale_price: '24.000')
velaSandia = Product.create!(name: 'Vela de Soya Sandia', description: 'Ultrahidratante natural', cost_price: '16.000', sale_price: '19.000')
velaMaracuya = Product.create!(name: 'Vela de Soya Maracuya', description: 'Ultrahidratante natural', cost_price: '16.000', sale_price: '19.000')
aceiteTerapeutico = Product.create!(name: 'Aceite Terapeutico', description: 'Reduce el dolor y activa la circulacion', cost_price: '15.000', sale_price: '32.000')
