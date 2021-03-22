class Api::V1::PatientSerializer < ActiveModel::Serializer

  	attributes 	:id_number,
  				:name,
  				:gender,
  				:phone_mobile,
  				:date_of_birth

  	def name
  		object.patient_name.present? ? object.patient_name : "#{object.first_name} #{object.last_name}"
  	end
end
