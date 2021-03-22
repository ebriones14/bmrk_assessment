class Api::V1::PatientsController < ApplicationController

	def create
		patient_lab = Api::Handler.generate_patient(patient_params)

		if patient_lab.save
			render json: patient_lab, serializer: Api::V1::PatientLabSerializer
		else
			render error: {error: 'Unable to create Patient.'}, status: 400
		end
	end


	private
		def patient_params
			if params[:patient_data].present?
				params.permit(
					:date_of_test, 
					:lab_number, 
					:clinic_code, 
					patient_data: [:id_number, :first_name, :last_name, :phone_mobile, :gender, :date_of_birth], 
					lab_studies: [:code, :name, :value, :unit, :ref_range, :finding, :result_state]
				)
			else
				params.permit(
					:date_of_test, 
					:id_number, 
					:patient_name, 
					:gender, 
					:date_of_birth, 
					:lab_number, 
					:clinic_code, 
					lab_studies: [:code, :name, :value, :unit, :ref_range, :finding, :result_state]
				)
			end
		end

end