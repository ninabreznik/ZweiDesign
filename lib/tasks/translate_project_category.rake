namespace :leads do
  desc "Translate project.category from slovene to english"
  task :translate_project_category => :environment do
    Project.tap{|projects| puts "Found #{projects.size} projects to work on"}.each do |project|
      if project.category == "Kuhinja"
        project.category = "Kitchen"
      elsif project.category == "Kopalnica"
        project.category = "Bathroom"
      elsif project.category == "Spalnica"
        project.category = "Sleeping room"
      elsif project.category == "Dnevni prostor"
        project.category = "Living area"
      elsif project.category == "Jedilnica"
        project.category = "Dining room"
      elsif project.category == "Otroški prostor"
        project.category = "Children area"
      elsif project.category == "Delovni prostor"
        project.category = "Working area"
      elsif project.category == "Prostor za shranjevanje"
        project.category = "Utility & Storage"
      elsif project.category == "Vhod in garderoba"
        project.category = "Entrance & Checkroom"
      elsif project.category == "Hodnik"
        project.category = "Corridor"
      elsif project.category == "Stopnišče"
        project.category = "Stairs"
      elsif project.category == "Klet"
        project.category = "Basement"
      elsif project.category == "Garaža"
        project.category = "Garage & Hobby"
      elsif project.category == "Hiša & fasade"
        project.category = "House & Fasades"
      elsif project.category == "Hiša in fasade"
        project.category = "House & Fasades"
      elsif project.category == "Okolica"
        project.category = "Surroundings"
      elsif project.category == "Svetila"
        project.category = "Lights"
      elsif project.category == "Hobi & dekor"
        project.category = "Art & Decor"
      elsif project.category == "Dekor"
        project.category = "Art & Decor"
      end
    end
  end
end