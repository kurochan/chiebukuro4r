require "chiebukuro/version"
require 'chiebukuro/api'
require 'chiebukuro/web'

module Chiebukuro
  class Chiebukuro
    include ChiebukuroAPI
    include ChiebukuroWeb

    def initialize(appid)
      @appid = appid
    end
  end
end
