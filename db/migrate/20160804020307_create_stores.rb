class CreateStores < ActiveRecord::Migration[5.0]
  def change
    create_table :stores do |t|
      t.references :user, foreign_key: true
      t.string :name      						#店名
      t.text :description							#説明 
      t.string :main_image						#店画像
      t.string :start_biz_hours 		#営業開始時間
      t.string :end_biz_hours				#営業終了時間
      t.integer :clock_in_time				#スタッフが出勤していないといけない時間
			t.references :user							#この店を作成したユーザーのID
			t.string :phone									#電話番号
			t.string :address								#住所
			t.string :postal								#郵便番号:

      t.timestamps
    end
  end
end
