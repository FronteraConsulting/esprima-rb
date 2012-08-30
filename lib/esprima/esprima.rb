# encoding: UTF-8

require 'v8'
require 'commonjs'

require File.join(File.dirname(__FILE__), "parser")

module Esprima
  def self.load_path
    @load_path ||= File.expand_path(File.join(File.dirname(__FILE__), "../../vendor"))
  end
end