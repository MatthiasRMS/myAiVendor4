# app/admin/users.rb
ActiveAdmin.register User do

  # Create sections on the index screen
  scope :all, default: true

  # Filterable attributes on the index screen
  filter :created_at

  # Customize columns displayed on the index screen in the table
  index do
      column :id
      column :email
      column :admin
      column :created_at
      column :updated_at
      column :current_sign_in_at
      column :last_sign_in_at
      actions
  end

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :admin
      f.input :password
      f.input :password_confirmation
    end
    f.button
  end

end
