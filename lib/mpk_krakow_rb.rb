# encoding: utf-8

require 'ostruct'
require 'open-uri'
require 'net/http'
require 'mpk_krakow_rb/version'
require 'mpk_krakow_rb/stops.rb'
require 'mpk_krakow_rb/stop.rb'
require 'mpk_krakow_rb/line_stop.rb'
require 'mpk_krakow_rb/fetchers/lines_for_stop'
require 'mpk_krakow_rb/fetchers/stops'
require 'mpk_krakow_rb/lines'
require 'mpk_krakow_rb/line'
require 'mpk_krakow_rb/fetchers/lines'
require 'mpk_krakow_rb/fetchers/stops_for_line'


module MpkKrakowRb
  class Com
    attr_reader :stops, :lines

    def initialize
      @stops = Stops.new
      @lines = Lines.new

      @stops.lines_list = @lines
      @lines.stops_list = @stops

      @stops.get_stops
      @lines.get_lines
    end
  end
end
