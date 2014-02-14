# encoding: utf-8

require 'justin/bundler_loader'

module Justin

  module Lock

    VERSION="0.0.2"

    def self.run
      dsl = Bundler::Dsl.new
      gemfile = STDIN.read
      dsl.eval_gemfile( "Gemfile", gemfile )
      definition = dsl.to_definition( nil, true )
      definition.resolve_remotely!

      puts definition.to_lock

      # Now we cheat like hell.  We need something to give us group
      # information in the install step.  It just so happens that we
      # can abuse the Gemfile.lock format *slightly* by tacking an
      # extra section on the tail.  When justin-stall reads the
      # Gemfile.lock, it chops this off before passing the two parts
      # to the bundler code.
      #
      # The alternative to this is completely changing the
      # Gemfile.lock format, which isn't something I'm hugely keen on
      # doing right now if it can be avoided.
      puts "GEMFILE"
      puts gemfile.gsub(/^/, "  ")
    end
  end


end
