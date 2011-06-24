require 'rake'
require 'geminabox'

module Hoe::Geminabox
  VERSION = '0.0.0'

  include Rake::DSL if defined?(Rake::DSL)

  def define_geminabox_tasks
    desc "Push gem to geminabox."
    task :release_to_geminabox => [:clean, :package, :release_sanity] do
      pkg = "pkg/#{spec.name}-#{spec.version}"
      gems = Dir["#{pkg}*.gem"]
      gems.each do |g|
        sh Gem.ruby, "-S", "gem", "inabox", g
      end
    end

    task :release_to => :release_to_geminabox
  end
end unless defined? Hoe::Geminabox
