class Patient < ApplicationRecord

	enum gender: [:male, :female]

	typed_store :patient_data, coder: PostgresCoder do |i|
		i.string :id_number, default: ""
	    i.string :first_name, default: ""
	    i.string :last_name, default: ""
	    i.string :phone_mobile, default: ""
	    i.string :gender, default: ""
	    i.date :date_of_birth, default: ""
	end

end
