 class Scraping
  def self.manga_urls
    agent = Mechanize.new
    links = []
    next_url ="https://www.cmoa.jp/genre/12/"
    while true
      current_page = agent.get(next_url)

      next_link = current_page.at('.next a')
      if next_url == "/search/result/?genre_id=0000012&sort=4&page=315"#うまくいかなかった
      	break
      end
      next_url = next_link.get_attribute('href')

      titles = current_page.search('.search_result_box_right_sec1 .title')
      new_titles = titles.map {|title|
      	a_title = title.inner_text
      	keywords = ["モノクロ版","カラー版","リマスター版","【電子特別版】","分冊版","【デジタル限定復刻版】","超合本版",
      		"【電子限定カラー特典付】","しんそー版","〔新装版〕","＋新装版","(ワイド版)","新装版","〔保存版〕","〔文庫版〕"," しんそ版","[無料版]",
      		"無料ダイジェスト版","【特別無料お試し版】","試し読み版","【電子版】","【電子コミックス特別編集版】","コミック版","テレビマガジン版",
      		" 【電子特別版 5冊 合本版】","-電子版-","電子版","改訂版","スマートフォン版","【カラー収録版】","＜特別改訂版＞","（合冊版）","【無料お試し版】",
      		"バイリンガル版","デジタルフォトブック付き電子限定版","ネーム付き特装版","〔無料版〕","―特筆版―","【無料立ち読み版】","[愛蔵版]","愛蔵版",
      		"【分割版】","特装版","《完全版》","完全版"]
      	keywords.each do |keyword|
      	  if a_title.include?(keyword)
      	  	a_title = a_title.delete(keyword)
      	  end
      	end
	    nums = ["（9）","（12）","（7）","（14）","（15）","（16）","（8）"]
	    nums.each do |num|
	      if a_title.include?("#{num}")
	    	a_title = a_title.delete!(num)
	      end
	    end

        a_title = a_title.lstrip!
    	  a_title = a_title.rstrip!
      }

      elements = current_page.search('.search_result_box_left img')
      image_urls = elements.map {|ele|
        ele.get_attribute(:src)
      }
      new_titles.zip(image_urls).each do |title,image_url|
	    product = Product.where(title: title).first_or_initialize
	    product.image_url = image_url
	  	product.title = title
	  	product.save
	  end
    end
  end
end
