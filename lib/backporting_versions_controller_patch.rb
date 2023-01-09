require_dependency 'versions_controller'

module Backporting
  module VersionControllerPatch
    def self.included(base) # :nodoc:
      base.extend(ClassMethods)
      base.send(:include, InstanceMethods)

      base.class_eval do
        unloadable # Send unloadable so it will not be unloaded in development

        alias_method :index_without_backport, :index
        alias_method :index, :index_with_backport
      end
    end
  end

  module ClassMethods
  end

  module InstanceMethods
    def index_with_backport
      index_with_backport

    end
  end
end

unless VersionController.included_modules.include? Backporting::VersionControllerPatch
  VersionController.send(:include, Backporting::VersionControllerPatch)
end
