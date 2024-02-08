Sentry.init do |config|
  config.dsn = 'https://fc5db812abe58a299de96dc2f964379f@o4506713064407040.ingest.sentry.io/4506713068077056'
  config.breadcrumbs_logger = [:active_support_logger, :http_logger]

  # Set traces_sample_rate to 1.0 to capture 100%
  # of transactions for performance monitoring.
  # We recommend adjusting this value in production.
  config.traces_sample_rate = 1.0
  # or
  config.traces_sampler = lambda do |context|
    true
  end
end
