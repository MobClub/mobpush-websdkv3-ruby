# coding: utf-8

require "mobpush/config/mobpush_config"
require "mobpush/http/mob_http"
require_relative 'push_work_builder'

class PushV3Client
    @PUSH_URI = "/v3/push/createPush"
    @GET_BY_WORKID_URI = "/v3/push/getByWorkId"
    @GET_BY_WORKNO_URI = "/v3/push/getByWorkno"
    @CANCEL_TASK_URI = "/push/drop"
    @REPLACE_TASK_URI = "/push/replace"
    @RECALL_TASK_URI = "/push/recall"

    class << self
        attr_accessor :PUSH_URI, :GET_BY_WORKID_URI, :GET_BY_WORKNO_URI, :CANCEL_TASK_URI, :REPLACE_TASK_URI, :RECALL_TASK_URI
    end


    include CommonHelper

    def pushTaskV3(push)
        url = MobPushConfig.baseUrl + PushV3Client.PUSH_URI
        MobHTTP.post(url, nil, os2hash(push))
    end

    def pushTaskV3ByBuilder(builder)
        pushTaskV3(builder.build())
    end

    def pushAll(workNo, title, content)
        pushTaskV3ByBuilder(PushWorkBuilder.new(workNo, title, content).targetAll())
    end

    def pushByAlias(workNo, title, content, *alia)
        pushTaskV3ByBuilder(PushWorkBuilder.new(workNo, title, content).targetAlias(alia))
    end

    def pushByTags(workNo, title, content, *tags)
        pushTaskV3ByBuilder(PushWorkBuilder.new(workNo, title, content).targetTags(tags))
    end

    def pushByRids(workNo, title, content, *rids)
        pushTaskV3ByBuilder(PushWorkBuilder.new(workNo, title, content).targetRids(rids))
    end

    def pushByAreas(workNo, title, content, pushAreas)
        pushTaskV3ByBuilder(PushWorkBuilder.new(workNo, title, content).targetAreas(pushAreas))
    end

    def cancelPushTask(workId)
        params = {:batchId => workId}
        MobHTTP.post(MobPushConfig.baseUrl + PushV3Client.CANCEL_TASK_URI, nil, params)
    end

    def replacePushTask(workId, content)
        params = {:batchId => workId, :content => content}
        MobHTTP.post(MobPushConfig.baseUrl + PushV3Client.REPLACE_TASK_URI, nil, params)
    end

    def recallPushTask(workId)
        params = {:batchId => workId}
        MobHTTP.post(MobPushConfig.baseUrl + PushV3Client.RECALL_TASK_URI, nil, params)
    end

    def getPushByBatchId(batchId)
        params = {:workId => batchId}
        MobHTTP.post(MobPushConfig.baseUrl + PushV3Client.GET_BY_WORKID_URI, nil, params)
    end

    def getPushByWorkno(workno)
        params = {:workno => workno}
        MobHTTP.post(MobPushConfig.baseUrl + PushV3Client.GET_BY_WORKNO_URI, nil, params)
    end
end