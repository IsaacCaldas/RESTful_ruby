namespace :dev do
  desc "Setting development environment"
  task setup: :environment do

    # puts "Rewinding the database..."
    # %x(rails db:drop db:create db:migrate)
    # puts "Rewinded database successfuly!"

    puts "Registering contacts types..."
    kinds = %w(Amigo Comercial Conhecido)
    kinds.each do |kind|
      Kind.create!(
        description: kind
      )
    end
    puts "Contacts types registered successfuly!"

    puts "Registering contacts..."
    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.birthday(min_age: 18, max_age: 65),
        kind: Kind.all.sample
      )
    end
    puts "Contacts registered successfuly!"

    puts "Registering Phone numbers..."
    Contact.all.each do |contact|
      Random.rand(5).times do |i|
        phone = Phone.create(number: Faker::PhoneNumber.cell_phone)
        contact.phones << phone
        contact.save!
      end
    end
    puts "Phone numbers registered successfuly!"

    puts "Registering contacts Address..."
    Contact.all.each do |contact|
      Address.create(
        street: Faker::Address.street_address,
        city: Faker::Address.city,
        contact: contact
      )
    end
    puts "Address registered successfuly!"

  end

end
