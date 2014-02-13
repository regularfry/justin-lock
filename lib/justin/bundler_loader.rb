# encoding: utf-8

require 'justin/tty_ui'

# Evil hack: we only copy what we need.
module Bundler
  def self.ui; Justin::TtyUI.new; end
  def self.app_cache; nil; end
  def self.settings; Settings.new; end

  # The version from which the contents of lib/bundler were plundered
  VERSION = "1.6.0.pre.2"


  class BundlerError < StandardError
    def self.status_code(code)
      define_method(:status_code) { code }
    end
  end

  class GemfileNotFound       < BundlerError; status_code(10) ; end
  class GemNotFound           < BundlerError; status_code(7)  ; end
  class GemfileError          < BundlerError; status_code(4)  ; end
  class InstallError          < BundlerError; status_code(5)  ; end
  class InstallHookError      < BundlerError; status_code(8)  ; end
  class PathError             < BundlerError; status_code(13) ; end
  class GitError              < BundlerError; status_code(11) ; end
  class DeprecatedError       < BundlerError; status_code(12) ; end
  class GemspecError          < BundlerError; status_code(14) ; end
  class InvalidOption         < BundlerError; status_code(15) ; end
  class ProductionError       < BundlerError; status_code(16) ; end
  class HTTPError             < BundlerError; status_code(17) ; end
  class RubyVersionMismatch   < BundlerError; status_code(18) ; end
  class SecurityError         < BundlerError; status_code(19) ; end
  class LockfileError         < BundlerError; status_code(20) ; end
  class CyclicDependencyError < BundlerError; status_code(21) ; end
  class GemfileLockNotFound   < BundlerError; status_code(22) ; end

  # Internal errors, should be rescued
  class VersionConflict  < BundlerError
    attr_reader :conflicts

    def initialize(conflicts, msg = nil)
      super(msg)
      @conflicts = conflicts
    end

    status_code(6)
  end

  class MarshalError < StandardError; end


  def self.load_marshal(data)
    Marshal.load(data)
  rescue => e
    raise MarshalError, "#{e.class}: #{e.message}"
  end


  def self.ruby_version
    @ruby_version ||= SystemRubyVersion.new
  end

end


# These have to be loaded after the above definition, because bundler
# uses autoloading to get them to load after the Bundler module is
# defined.
require 'bundler/dsl'
require 'bundler/source'
require 'bundler/definition'
require 'bundler/spec_set'
require 'bundler/settings'
require 'bundler/resolver'
require 'bundler/dep_proxy'
require 'bundler/index'
require 'bundler/remote_specification'
require 'bundler/lazy_specification'
require 'bundler/endpoint_specification'
require 'bundler/fetcher'
require 'bundler/ruby_version'
require 'bundler/retry'
