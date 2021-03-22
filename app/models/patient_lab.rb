class PatientLab < ApplicationRecord

	serialize :lab_studies, Hash

  	belongs_to :patient
end
