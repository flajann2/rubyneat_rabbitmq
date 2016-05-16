# -*- coding: utf-8 -*-
require 'rubyneat'
require 'rubyneat/cli'
require 'bunny'
require 'thor'
require 'rubyneat'
require 'json'
require 'awesome_print'
require 'parser'
require 'unparser'

module NEATMQ
  module Sexp
    def s(type, *children)
      Parser::AST::Node.new(type, children)
    end
  end
end

require_relative 'rubyneat_rabbitmq/cli'
require_relative 'rubyneat_rabbitmq/dsl'
require_relative 'rubyneat_rabbitmq/monkey'
