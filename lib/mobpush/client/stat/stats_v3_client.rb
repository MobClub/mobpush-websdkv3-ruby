# coding: utf-8

require "mobpush/config/mobpush_config"
require "mobpush/http/mob_http"

class StatsV3Client
    @GET_BY_WORKID_URI = "/v3/stats/getByWorkId"
    @GET_BY_WORKIDS_URI = "/v3/stats/getByWorkIds"
    @GET_BY_WORKNO_URI = "/v3/stats/getByWorkno"
    @GET_BY_HOUR_URI = "/v3/stats/getByHour"
    @GET_BY_DAY_URI = "/v3/stats/getByDay"
    @GET_BY_DEVICE_URI = "/v3/stats/getByDevice"


    class << self
        attr_accessor :GET_BY_WORKID_URI, :GET_BY_WORKIDS_URI, :GET_BY_WORKNO_URI, :GET_BY_HOUR_URI, :GET_BY_DAY_URI, :GET_BY_DEVICE_URI
    end

    def getStatsByWorkId(workId)
        params = {:workId => workId}
        url = MobPushConfig.baseUrl + StatsV3Client.GET_BY_WORKID_URI
        MobHTTP.post(url, nil, params)
    end

    def getStatsByWorkIds(workIds)
        params = {:workIds => workIds}
        url = MobPushConfig.baseUrl + StatsV3Client.GET_BY_WORKIDS_URI
        MobHTTP.post(url, nil, params)
    end

    def getStatsByWorkno(workno)
        params = {:workno => workno}
        url = MobPushConfig.baseUrl + StatsV3Client.GET_BY_WORKNO_URI
        MobHTTP.post(url, nil, params)
    end

    def getStatsByHour(hour)
        params = {:hour => hour}
        url = MobPushConfig.baseUrl + StatsV3Client.GET_BY_HOUR_URI
        MobHTTP.post(url, nil, params)
    end

    def getStatsByDay(day)
        params = {:day => day}
        url = MobPushConfig.baseUrl + StatsV3Client.GET_BY_DAY_URI
        MobHTTP.post(url, nil, params)
    end

    def getStatsByDevice(workId, pageIndex, pageSize)
        params = {:workId => workId, :pageIndex => pageIndex, :pageSize => pageSize}
        url = MobPushConfig.baseUrl + StatsV3Client.GET_BY_DEVICE_URI
        MobHTTP.post(url, nil, params)
    end
end