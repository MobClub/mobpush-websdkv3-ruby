# coding: utf-8

module MobHttp
    class Result
        ERROR = 500
        SUCCESS = 200

        attr_accessor :status, :error, :res, :responseCode

        def to_s
            %{
                status: #{@status},
                error: #{@error},
                res: #{res}
            }
        end
    end
end