require "rails_helper"

describe User do

	describe "オリジナルメソッドの処理" do
		before do
			@user = User.first
		end

		context "User#start_upをテスト" do

			before do
				@before_create_store_count = Store.count
				@new_store = @user.start_up("あんじん", "0724660188","10:00","19:00",9)
				@store = Store.last
			end

			it "同じ名前？" do
				expect(@new_store.name).to eq @store.name
			end
		end

	end

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

	describe "保存に失敗する条件をテストする" do
		before do
			@data = {
				email: "suzaku622@gmail.com",
				password: "password",
			}
		end
		
		it "重複登録ができない状態なら正解" do
			User.create(@data)
			user = User.new @data
			expect(user.save).to eq false
		end

		["name","phone","begin_employment","email", "password"].each do |index|
			it "必要項目#{index}が存在しない" do
				@data[index] = nil
				user = User.new @data
				expect(user.save).to eq false
			end
		end
	end

end

