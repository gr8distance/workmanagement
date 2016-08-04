#coding: utf-8
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	
	validates_presence_of :name, :email,:password,:phone, :begin_employment,
		message: "この項目は入力が必須の項目です"


	#ユーザーが事業のオーナーになる場合の処理
	def start_up name,phone,start_biz_hours, end_biz_hours,clock_in_time
		s = Store.new({
			name: name,
			phone: phone,
			start_biz_hours: start_biz_hours,
			end_biz_hours: end_biz_hours,
			clock_in_time: (clock_in_time * 60),
			user: self
		})
		if s.save
			return s
		else
			return s.errors
		end
	end

end
