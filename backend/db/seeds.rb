# user = User.create(
#   email: Rails.application.credentials.dig(:db, :admin_email),
#   password: Rails.application.credentials.dig(:db, :password),
#   password_confirmation: Rails.application.credentials.dig(:db, :password),
#   name: Rails.application.credentials.dig(:db, :admin_name),
#   role: 'user'
# )

# if user
#   Rails.logger.info "Login with #{Rails.application.credentials.dig(:db, :admin_email)} and #{Rails.application.credentials.dig(:db, :password)}"
# end


Category.destroy_all
bienestar = Category.create!(name: 'Bienestar', description: 'Categoria de Bienestar')
facial = Category.create!(name: 'Facial', description: 'Categoria facial')
capilar = Category.create!(name: 'Capilar', description: 'Categoria capilar')
aceitesEsenciales = Category.create!(name: 'Aceites Esenciales', description: 'Categoria de Aceites')

Product.destroy_all
bruma = Product.create!(name: 'Bruma', description: 'Ideal para el sueno', price_cents: 8000, category: bienestar)
rollonMenta = Product.create!(name: 'Roll on Menta', description: 'Ideal para el dolor de cabeza', price_cents: 10000, category: bienestar)
velaSandia = Product.create!(name: 'Vela de Soya Sandia', description: 'Ultrahidratante natural', price_cents: 16000, category: bienestar)
velaMaracuya = Product.create!(name: 'Vela de Soya Maracuya', description: 'Ultrahidratante natural', price_cents: 16000, category: bienestar)
aceiteTerapeutico = Product.create!(name: 'Aceite Terapeutico', description: 'Reduce el dolor y activa la circulacion', price_cents: 15000, category: bienestar)
aceiteTerapeutico = Product.create!(name: 'Bruma Purificacion Natural', description: 'Ideal para purificar', price_cents: 15000, category: bienestar)
tonicoFloral = Product.create!(name: 'Tonico Floral', description: 'Especial para preparar el rostro', price_cents: 15000, category: facial)
tonicoAcne = Product.create!(name: 'Tonico Acne', description: 'Especial para el acne en el cuerpo', price_cents: 15000, category: facial)
jabonCitrico = Product.create!(name: 'Jabon Citrico', description: 'Refresca e hidrata la piel', price_cents: 15000, category: facial)
jabonAvena = Product.create!(name: 'Jabon Avena', description: 'Refresca e hidrata la piel', price_cents: 15000, category: facial)
jabonArbolDeTe = Product.create!(name: 'Jabon Arbol de Te', description: 'Refresca e hidrata la piel', price_cents: 15000, category: facial)
jabonCafe = Product.create!(name: 'Jabon Cafe', description: 'Refresca e hidrata la piel', price_cents: 15000, category: facial)

CartItem.destroy_all
cart1 = CartItem.create!(product: bruma)
cart2 = CartItem.create!(product: rollonMenta)
