class AddAttachmentsAvatarToProyect < ActiveRecord::Migration
    def self.up
      add_column :proyects, :avatar_file_name,    :string
      add_column :proyects, :avatar_content_type, :string
      add_column :proyects, :avatar_file_size,    :integer
      add_column :proyects, :avatar_updated_at,   :datetime
    end

    def self.down
      remove_column :proyects, :avatar_file_name
      remove_column :proyects, :avatar_content_type
      remove_column :proyects, :avatar_file_size
      remove_column :proyects, :avatar_updated_at
    end

end
