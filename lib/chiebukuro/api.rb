require 'uri'
require 'open-uri'
require 'active_support'

module ChiebukuroAPI
  API_BASE_URL = "http://chiebukuro.yahooapis.jp/Chiebukuro/V1"
  API_LIST = [
    :questionSearch,
    :categoryTree,
    :getNewQuestionList,
    :detailSearch,
    :postQuestion,
    :postQuestionPreview,
    :postQueSupplement,
    :postQueSupplementPreview,
    :cancelQuestion,
    :cancelQuestionPreview,
    :selectBestAnswer,
    :postAnswer,
    :postAnswerPreview,
    :cancelAnswer,
    :cancelAnswerPreview,
  ]

  def method_missing(name, params = {})
    raise(ChiebukuroAPIException, "API #{name} does not exists.") unless API_LIST.include? name
    params['appid'] = @appid
    xml = open(URI.encode("#{API_BASE_URL}/#{name}#{to_query(params)}")).read
    ActiveSupport::XmlMini.parse(xml)['ResultSet']
  end

  def to_query(hash)
    '?' + hash.inject(''){|q, h| "#{q}#{h[0]}=#{h[1]}&"}
  end

  class ChiebukuroAPIException < Exception; end
end
