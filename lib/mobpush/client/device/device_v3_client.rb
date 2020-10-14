# coding: utf-8

require "mobpush/config/mobpush_config"
require "mobpush/http/mob_http"

class DeviceV3Client
    @GET_BY_RID = "/device-v3/getById/"
    @GET_DEVICE_DISTRIBUTION = "/device-v3/distribution/"
    @GET_BY_ALIAS = "/device-v3/getByAlias/"
    @UPDATE_ALIAS = "/device-v3/updateAlias/"
    @UPDATE_TAGS = "/device-v3/updateTags"
    @QUERY_BY_TAGS = "/device-v3/queryByTags"

    class << self
        attr_accessor :GET_BY_RID, :GET_DEVICE_DISTRIBUTION, :GET_BY_ALIAS, :UPDATE_ALIAS, :UPDATE_TAGS, :QUERY_BY_TAGS
    end

    def getByRid(registrationId)
        params = {:registrationId => registrationId}
        url = MobPushConfig.baseUrl + DeviceV3Client.GET_BY_RID + registrationId
        MobHTTP.get(url, nil, params)
    end

    def getDeviceDistribution()
        url = MobPushConfig.baseUrl + DeviceV3Client.GET_DEVICE_DISTRIBUTION
        MobHTTP.get(url, nil, {})
    end

    def queryByAlias(_alias)
        params = {:alias => _alias}
        url = MobPushConfig.baseUrl + DeviceV3Client.GET_BY_ALIAS + _alias
        MobHTTP.get(url, nil, params)
    end

    def updateAlias(_alias, registrationId)
        params = {:alias => _alias, :registrationId => registrationId}
        url = MobPushConfig.baseUrl + DeviceV3Client.UPDATE_ALIAS
        MobHTTP.post(url, nil, params)
    end

    def updateTags(tags, registrationId, opType)
        params = {:tags => tags, :registrationId => registrationId, :opType => opType}
        url = MobPushConfig.baseUrl + DeviceV3Client.UPDATE_TAGS
        MobHTTP.post(url, nil, params)
    end

    def queryByTags(tags)
        params = {:tags => tags}
        url = MobPushConfig.baseUrl + DeviceV3Client.QUERY_BY_TAGS
        MobHTTP.post(url, nil, params)
    end
end