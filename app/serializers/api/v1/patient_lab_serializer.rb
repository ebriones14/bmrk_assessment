class Api::V1::PatientLabSerializer < ActiveModel::Serializer

	belongs_to 	:patient

	attributes 	:date_of_test,
				:lab_number,
				:clinic_code,
				:lab_studies

end
