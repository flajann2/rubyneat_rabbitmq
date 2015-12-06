# -*- coding: utf-8 -*-

=begin rdoc
= Basic CLI (Not Implemented Yet)
=end

module NEATMQ
  module Cli
    class MQMain < Thor
      desc 'list', 'List the available neaters. Note that the neaters are not checked to see if they implement the rabbit directive.'
      def list
        Dir.glob(NEATGLOB).sort.each do |ne|
          puts 'neatmq work ' + File.basename(ne).gsub(%r{_neat\.rb}, '')
        end
      end
      #subcommand 'list', NEAT::Cli::List

      desc 'work <neater> [OPTS]', 'run RabbitMQ neater workers'
      option :count, type: :numeric, banner: 'count'
      def work(worker)
        workers = options[:count] || 1
        NEAT::controller.verbosity = options[:verbose].to_i if options[:verbose]
        load "neater/#{worker}_neat.rb"
      end
    end
  end
end
