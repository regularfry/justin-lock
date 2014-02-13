# encoding: utf-8

require 'justin/bundler_loader'

module Justin

  module Lock

    VERSION="0.0.1"

    def self.run
      dsl = Bundler::Dsl.new
      dsl.eval_gemfile( "Gemfile", STDIN.read )
      definition = dsl.to_definition( nil, true )
      definition.resolve_remotely!
      puts definition.to_lock
    end
  end


end
