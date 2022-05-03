class AddJjitSchema < ActiveRecord::Migration[7.1]
  def change
    create_table :offers do |t|
      t.string :title
      t.string :street
      t.string :city
      t.string :country_code
      t.string :address_text
      t.string :marker_icon
      t.string :workplace_type
      t.string :company_name
      t.string :company_url
      t.string :company_size
      t.string :experience_level
      t.decimal :latitude
      t.decimal :longitude
      t.datetime :published_at
      t.boolean :remote_interview
      t.boolean :open_to_hire_ukrainians
      t.string :jjit_id
      t.boolean :display_offer
      t.boolean :remote
      t.boolean :way_of_apply
      t.string :company_logo_url
      t.timestamps
    end
    add_index :offers, :jjit_id

    create_table :employment_types do |t|
      t.references :offer
      t.string :name
      t.integer :from
      t.integer :to
      t.string :currency
      t.timestamps
    end

    create_table :skills do |t|
      t.string :name
      t.integer :level
      t.timestamps
    end

    create_join_table :offers, :skills

    create_table :multilocations do |t|
      t.references :offer
      t.string :city
      t.string :slug
      t.string :street
      t.timestamps
    end
  end
end
