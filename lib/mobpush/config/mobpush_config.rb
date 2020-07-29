# coding: utf-8

module MobPushConfig
    @baseUrl = "http://api.push.mob.com"
    
    class << self
        attr_accessor :appkey, :appSecret, :baseUrl
    end
end