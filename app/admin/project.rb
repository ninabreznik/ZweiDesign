ActiveAdmin.register Project do

permit_params :user_id, :title, :picture_file_name, :picture_content_type, :picture_file_size, :picture_updated_at, :description, :email

index do
  selectable_column
  id_column
  column :user_id  
  column :email
  column :title
  column :category
  column :picture_updated_at
  column :picture_file_name
  column :picture_content_type
  column :picture_file_size
  actions
end

  filter :user_id  
  filter :email
  filter :title
  filter :category
  filter :picture_updated_at
  filter :picture_file_name
  filter :picture_content_type
  filter :picture_file_size

form do |f|
  f.inputs "Project Details" do
  f.input :user_id  
  f.input :email
  f.input :title
  f.input :category
  f.input :picture_updated_at
  f.input :picture_file_name
  f.input :picture_content_type
  f.input :picture_file_size
  end
  f.actions
end

end
