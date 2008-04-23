require 'daemons'

# Usage
# To see logger output, run in foreground like this:
# script/runner ./lib/audio_processor.rb run
# Otherwise, fork it into the background:
# script/runner ./lib/audio_processor.rb start | stop | restart

class AudioProcessor
  include Singleton
  ActiveRecord::Base.logger = nil
  ActiveRecord::Base.logger = Logger.new(STDOUT) if ENV['RAILS_ENV'] == 'development'
  def run
    loop do
      job = Job.next
      unless job.blank?
        job.process!
      else
        sleep 10
      end
    end
  end
end

Daemons.run_proc('AudioProcessor') do
  AudioProcessor.instance.run
end
