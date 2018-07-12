class FixTitle
	def self.test
		products = Product.all
	    products.each do |product|
		    	keywords = ["KC完結版","手塚治虫文庫全集","マンガで分かる！ ","(フルカラー)","公式アンソロジーコミック","電撃コミックアンソロジー","4コマコミックアンソロジー",
		    		"【フルカラー】","(デジタルセレクション）","公式ガイドブック","STARTER BOOK","【むりょうばーじょん】","公式キャラクターブック Ultra Archive","(電子特別)","デジタルセレクション",
		    	  " TVアニメ化記念ためし読み小冊子","公式アンソロジー","無料ためし読み小冊子","【デジル】","アニメコミックス","【フル】","【デジタルリマスター】",
		    	  "デフォルトアンソロジー","【電子早読み版】","キャラクターオフィシャルデータBOOK","キャラクターブック","(小学一年生版)","（柳沢きみお）","(村生ミオ)"]

		      keywords.each do |keyword|
		      	if product.title.include?(keyword)
		      	  product.title.slice!(keyword)
		      	end
		     end
		     product.save
    end	
	end
end