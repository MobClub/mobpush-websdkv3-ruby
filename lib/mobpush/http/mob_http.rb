# coding: utf-8

require 'mobpush/config/mobpush_config'
require 'mobpush/utils/common_helper'
require_relative 'result'

module MobHTTP
    extend self
    
    require 'digest'
    require 'ostruct'
    require 'net/http'
    require 'json'

    extend CommonHelper

    def post(url, headers = nil, data)
        uri = URI(url)
        
        data["appkey"] = MobPushConfig.appkey

        headers = headers.nil? ? {} : headers
        headers["sign"] = serverSign(data.to_json, MobPushConfig.appSecret)
        headers["key"] = MobPushConfig.appkey
        headers['Content-Type'] = 'application/json'

        req = Net::HTTP::Post.new(uri, headers)
        req.body = data.to_json
        resp = Net::HTTP.start(uri.hostname, uri.port, :read_timeout => 10, :open_timeout => 10, :write_timeout => 10) do |http|
            http.request(req)
        end

        result = MobHttp::Result.new()
        result.responseCode = resp.code.to_i
        if resp.code.to_i == MobHttp::Result::SUCCESS
            result.status = MobHttp::Result::SUCCESS
            result.res = hash2os(JSON.parse(resp.body)['res'])
        else
            result.status = MobHttp::Result::ERROR
            result.error = JSON.parse(resp.body)['error']
        end
        result
    end

    def serverSign(data, secret)
        Digest::MD5.hexdigest(data + secret)
    end
end