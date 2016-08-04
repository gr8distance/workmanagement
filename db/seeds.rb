
begin
	User.create({
		name: "UG",
		phone: "08033338888",
		email: "info@anging.co.jp",
		password: "password",
		begin_employment: Time.now
	})
	
	puts "OK"
rescue => e
	puts e
end
