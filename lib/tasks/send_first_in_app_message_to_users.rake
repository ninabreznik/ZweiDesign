namespace :users do
  desc "Send the first in app message to users already in database"
  task :send_first_message => :environment do
    User.all.tap{|users| puts "Found #{users.size} leads to work on"}.each do |user|
    beta = user
    if user.country == "Slovenia"
      User.find_by_id(1).send_message(beta, "Pozdravljeni, vsakič ko se bo nekdo zanimal za vaš projekt oz. sodelovanje z vami, vas bomo obvestili. Vsa prejeta in poslana sporočila najdete med Vašimi sporočili.", "Kako pošiljate in sprejemate sporočila.")
    else 
      User.find_by_id(1).send_message(beta, "Hi, this is Nina from ZweiDesign. Just wanted to tell you, that each time someone will send you a message, we will notify you via your email. We encourage you to get in touch with other providers and get to know them. You can send a message throught user's projects or their profile pages.", "ZweiDesign Messages.")
    end
    end
  end
end

