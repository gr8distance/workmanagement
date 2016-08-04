require 'rails_helper'

# Name								-> 店名
# Description					-> 店説明
# Main Image					-> 主な画像
# phone
# address
# postal							
# start_biz_hours			-> 出勤していないと行けない時間
# end_biz_hours 			-> 残業との境の時間
# clock_in_time 			-> スタッフがいないといけない時間を入力（分単位)

RSpec.describe Store, type: :model do
	
	describe "保存できる条件をテストする" do
		before do
			@data = {
				name: "あんじん",
				start_biz_hours: "10:00", 
				end_biz_hours: "17:00",
				clock_in_time: 540,
				user: User.first,
				phone: "08033339999"
			}
		end

		it "保存に成功する" do
			s = Store.new @data
			expect(s.save).to eq true
		end
	end


	describe "保存できない条件をテストする" do
		before do
			@data = {
				name: "あんじん",
				start_biz_hours: "10:00", 
				end_biz_hours: "17:00",
				clock_in_time: 540,
				user: User.first,
				phone: "08033339999"
			}
		end

		context "保存に必要な項目がない" do
			%W{name start_biz_hours end_biz_hours clock_in_time phone user_id}.each do |sin|
				it "#{sin}がnilの場合は保存に失敗する" do
					s = Store.new @data
					s[sin] = nil
					expect(s.save).to eq false
				end
			end
		end
		
		context "電話番号に変な値を入力している" do
			
			it "電話番号に数字以外が混じっている" do
				s = Store.new @data
				s.phone = "asdfghjkla"
				expect(s.save).to eq false
			end
			
			%W{012345678901 012345678}.each do |sin|
				it "電話番号の桁数がおかしい #{sin.length}" do
					s = Store.new @data
					s.phone = sin
					expect(s.save).to eq false
				end
			end
		end

		context "おかしなフォーマットで営業、閉店時間を入力した" do
			%W{start_biz_hours end_biz_hours}.each do |sin|
				it "#{sin}に文字列が入力されている" do
					s = Store.new @data
					s.start_biz_hours = "hello world"
					expect(s.save).to eq false
				end
			end
		end
	end
end
