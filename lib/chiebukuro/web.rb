require 'open-uri'
require 'nokogiri'

module ChiebukuroWeb
  DETAIL_BASE_URL = "http://detail.chiebukuro.yahoo.co.jp/qa/question_detail"
  USER_AGENT = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.101 Safari/537.36'
  DETAIL_QUESTION_USER_XPATH = '//*[@id="main"]/div[3]/div/div[1]/p[1]/a/em'
  DETAIL_TOP_ANSWER_USER_XPATH = '//*[@id="main"]/div[4]/div/div[1]/p[1]/a/em'

  def get_question_detail(number)
    charset = nil
    html = open("#{DETAIL_BASE_URL}/q#{number}", 'User-Agent' => USER_AGENT) do |f|
      charset = f.charset
      f.read
    end
    Nokogiri::HTML.parse(html, USER_AGENT, charset)
  end
end
