class SetupForAirports < ActiveRecord::Migration[6.0]
  def change
    create_table :districts do |t|
      t.string :name
      t.timestamps
    end

    add_reference :panchayats, :district, index: true

    create_table :applications do |t|
      t.references :user
    end

    create_table :travellers do |t|
      t.string :name
      t.string :passport_number
      t.string :phone
      t.string :alternate_contact
      t.date :dob
      t.string :gender
      t.string :permanent_address
      t.references :application
      t.timestamps
    end

    create_table :houses do |t|
      t.string :name
      t.string :address
      t.string :ward
      t.references :panchayat
      t.string :contact_number
      t.string :contact_person
      t.string :comment
      t.string :status
      t.references :application
      t.timestamps
    end

    create_table :health_reports do |t|
      t.boolean :has_diabetes
      t.boolean :has_hyper_tension
      t.boolean :has_heart_disease
      t.boolean :has_kidney_disease
      t.boolean :is_pregnant
      t.string :recent_history
      t.string :symptoms
      t.boolean :primary_contact
      t.boolean :has_tested
      t.boolean :was_positive
      t.string :test_type
      t.references :traveller
      t.timestamps
    end
  end
end
