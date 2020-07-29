# coding: utf-8

require 'ostruct'

module CommonHelper
    def sanitze_hash(h)
        h.delete_if do |k, v|
            v.nil? || (v.respond_to?('empty?') ? v.empty? : false)
        end
    end

    def os2hash(os)
        h = {}
        os.each_pair do |k, v|
            if v.is_a?(OpenStruct)
                h[k] = os2hash(v)
            else
                h[k] = v
            end
        end
        h
    end

    def hash2os(h)
        if h.is_a?(Hash)
            os = OpenStruct.new()
            h.each do |k, v|
                if v.is_a?(Hash)
                    os.send("#{k}=", hash2os(v))
                elsif v.is_a?(Array)
                    os.send("#{k}=", v.map{ |e| hash2os(e)})
                else
                    os.send("#{k}=", v)
                end
            end
            os
        elsif h.is_a?(Array)
            h.map do |e|
                hash2os(e)
            end
        else
            h
        end
    end
end