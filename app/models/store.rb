#coding: utf-8
class Store < ApplicationRecord
  belongs_to :user

	validates_presence_of :name, :start_biz_hours, :end_biz_hours, :clock_in_time, :phone,:user_id,
		message: "この項目は空欄にはできません"

	#入力状況のフォーマット(開業、閉業時間)
	validates :start_biz_hours, :end_biz_hours,
		format: {with: /\A[0-1][0-9]:[0-5][0-9]\z/}

	#入力状況のフォーマット(電話番号)
	validates_length_of :phone,
		minimum: 10,
		maximum: 11
	
	validates :phone,
		format: {with: /\A[0-9]*[0-9]\z/}

end
