namespace :users do
  desc "Send the first in app message to users already in database"
  task :send_first_message => :environment do
    User.all.tap{|users| puts "Found #{users.size} leads to work on"}.each do |user|
    beta = user
    User.find_by_id(1).send_message(beta, "Pozdravljeni, vsakič ko izberete nov kontakt in kliknete 'Kontaktirajte ponudnika' boste poslali ponudniku avtomatično sporočilo. Tukaj pa nato nadaljujete pogovor z njim. Za vsa vprašanja pa imate sedaj tudi moj kontakt. Z veseljem sem vam vedno na voljo.", "Sosed.biz sporočilo")
    end
  end
end

