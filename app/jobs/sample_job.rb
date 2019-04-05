class SampleJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    # このジョブについては仕事をしないジョブです。
    Sidekiq::Logging.logger.info "サンプルジョブを実行!!!!!!!!#{args[0].name} #{args[1]}"
  end
end
