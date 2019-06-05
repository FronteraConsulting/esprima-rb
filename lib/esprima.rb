# encoding: UTF-8

require 'execjs'
#require 'commonjs'
require 'commonjs-mini_racer_env'
require 'escodegen'

require 'esprima/parser'
require 'esprima/ast'

# hack for inconsistency between Ruby 1.8 and 1.9
Enumerator = Enumerable::Enumerator unless defined?(Enumerator)

module Esprima
  class << self
    def load_path
      @load_path ||= File.expand_path(File.join(File.dirname(__FILE__), "../vendor"))
    end

    def new_environment
      context = new_context
      env = CommonJS::MiniRacerEnv.new(context, :path => Esprima.load_path)
      #env.require("esprima")
      env.runtime.eval(%q|var esprima = require('esprima')|)
      env.runtime
    end

    protected

    def new_context
      # cxt_obj = ExecJS.runtime.class::Context.new(nil)
      # cxt_var = cxt_obj.instance_variables.select { |var_name| var_name.to_s.include?("context") }.first
      # cxt_obj.instance_variable_get(cxt_var)
      MiniRacer::Context.new
    end
  end
end
