if Rails.env.development? || Rails.env.test?
  require "bundler/audit/cli"

  # rake bundler:audit
  namespace :bundler do
    task :audit do
      %w(update check).each do |command|
        Bundler::Audit::CLI.start [command]
      end
    end
  end
end
