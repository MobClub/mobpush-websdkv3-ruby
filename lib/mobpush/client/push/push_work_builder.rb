# coding: utf-8

require 'ostruct'
require 'mobpush/model/push_target'

class PushWorkBuilder
    def initialize(workno, title, content)
        @push = OpenStruct.new(workno: workno, source: 'webapi')
        @push.pushTarget = OpenStruct.new(tagsType: 1)
        @push.pushNotify = OpenStruct.new(title: title, content: content, taskCron: 0,
            plats: [1, 2], iosProduction: 1, offlineSeconds: 3600, type: 1)
        @push.pushOperator = OpenStruct.new()
    end

    def targetAll()
        @push.pushTarget.target = PushTarget::TARGET_ALL
        self
    end

    def targetAlias(*alia)
        @push.pushTarget.target = PushTarget::TARGET_ALIAS
        @push.pushTarget.alias = alia.uniq
        self
    end

    def targetTags(*tags)
        @push.pushTarget.target = PushTarget::TARGET_TAGS
        @push.pushTarget.tags = tags.uniq
        self
    end

    def targetRids(*rids)
        @push.pushTarget.target = PushTarget::TARGET_RIDS
        @push.pushTarget.rids = rids.uniq
        self
    end

    def targetAreas(pushAreas)
        @push.pushTarget.target = PushTarget::TARGET_AREAS
        @push.pushTarget.pushAreas = pushAreas
        self
    end


    def build()
        @push
    end
end