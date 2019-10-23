require "ffaker"

namespace :seed_data do
  desc "Seed data"

  task users: :environment do
    User.create!(
      email: "admin@gmail.com ",
      name: "DangPham",
      password: "111111",
      is_admin: 1,
      created_at: Time.zone.now)

      User.create!(
        email: "member@gmail.com",
        name: "member",
        password: "111111",
        is_admin: 0,
        created_at: Time.zone.now)
  end

  task categories: :environment do
    Category.create!(name: "Premier League",
      created_at: Time.zone.now)
    
    Category.create!(name: "SeriA",
      created_at: Time.zone.now)
  end

  task categories: :environment do
    Category.create!(name: "Premier League",
      created_at: Time.zone.now)
    
    Category.create!(name: "SeriA",
      created_at: Time.zone.now)
  end

  task leagues: :environment do
    5.times do |n|
      name = "League#{n+1}"
      country = "country#{n+1}"
      League.create!(name: name,
      country: country,
      created_at: Time.zone.now)
    end
  end

  task football_clubs: :environment do
    20.times do |n|
      name = "Foorball_club#{n+1}"
      stadium = "Stadium#{n+1}"
      FootballClub.create!(name: name,
      description: "this is #{name}",
      member: 25,
      stadium: stadium,
      created_at: Time.zone.now)
    end
  end

  task players: :environment do
    100.times do |n|
      name = FFaker::Name.name
      number = rand(1..99)
      position = rand(1..10)
      country = FFaker::Address.country
      birthday = FFaker::Time.date
      football_club_id = rand(6..10)
      Player.create!(name: name,
      number: number,
      position: position,
      country: country,
      birthday: birthday,
      football_club_id: football_club_id,
      created_at: Time.zone.now)
    end
  end
end
