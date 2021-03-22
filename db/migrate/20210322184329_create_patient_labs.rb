class CreatePatientLabs < ActiveRecord::Migration[6.1]
  def change
    create_table :patient_labs do |t|
      t.datetime :date_of_test
      t.string :lab_number
      t.string :clinic_code
      t.text :lab_studies
      t.references :patient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
