module Api
	class Handler < Base

		attr_accessor 	:date_of_test, 
						:id_number, 
						:patient_name, 
						:gender, 
						:date_of_birth, 
						:lab_number, 
						:clinic_code, 
						:patient_data, 
						:lab_studies


		def self.generate_patient(params)
			obj = Handler.new(params)

			patient_lab = PatientLab.new(
				date_of_test: 	obj.filtered_date_of_test, 
				lab_number: 	obj.lab_number, 
				clinic_code: 	obj.clinic_code, 
				lab_studies: 	obj.hashed_lab_studies
			)

			pat 				= patient_lab.build_patient
			pat.patient_name 	= obj.patient_name
			pat.id_number 		= obj.id_number
			pat.gender 			= obj.gender
			pat.patient_data 	= obj.patient_data if obj.patient_data
			pat.date_of_birth 	= obj.filtered_date_of_birth

			patient_lab
		end

		def hashed_lab_studies
			Hash[*lab_studies]
		end

		def filtered_date_of_birth
			dob = date_of_birth.present? ? date_of_birth : patient_data[:date_of_birth]

			dob.to_time.to_date
		end

		def filtered_date_of_test
			date_of_test.to_datetime if date_of_test
		end

	end
end