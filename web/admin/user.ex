defmodule Tire.ExAdmin.User do
  use ExAdmin.Register

  register_resource Tire.User do
    index do
      selectable_column

      column :id
      column :name
      column :email
      column :admin
      column :last_sign_in_at
      column :last_sign_in_ip
      column :sign_in_count
    end

    show _user do
      attributes_table do
        row :id
        row :name
        row :email
        row :admin
        row :reset_password_token
        row :reset_password_sent_at
        row :locked_at
        row :unlock_token
        row :sign_in_count
        row :current_sign_in_at
        row :last_sign_in_at
        row :current_sign_in_ip
        row :last_sign_in_ip
      end
    end

    form user do
      inputs do
        input user, :name
        input user, :email
        input user, :admin, as: :radio
        input user, :password, type: :password
        input user, :password_confirmation, type: :password
      end
    end
  end
end
