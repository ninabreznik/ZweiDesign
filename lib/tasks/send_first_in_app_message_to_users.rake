namespace :users do
  desc "Send the first in app message to users already in database"
  task :send_first_message => :environment do
    User.all.tap{|users| puts "Found #{users.size} leads to work on"}.each do |user|
    beta = user
    User.find_by_id(1).send_message(beta, "Pozdravljeni, vsakič ko se bo nekdo zanimal za vaš projekt oz. sodelovanje z vami, vas bomo obvestili. Vsa prejeta in poslana sporočila najdete med Vašimi sporočili. Za vsa vprašanja pa smo vam vedno na voljo na nina.breznik@sosed.si.", "Sosed.biz sporočila")
    end
  end
end

