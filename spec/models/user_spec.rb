require "rails_helper"

describe User do

	it "必要項目が揃っている場合は保存できる" do
		u = User.new({
			name: "UG",
			email: "suzaku622@gmail.com",
			password: "password",
			password_confirmation: "password",
			phone: "08099998888",
			begin_employment: Time.now
		})

		expect(u.save).to eq true
	end

end

