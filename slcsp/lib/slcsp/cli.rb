# frozen_string_literal: true

class CLI
  # verbose allows us to moc out logging when running tests
  def initialize(verbose = true)
    @log = Log.instance()
    @log.defaults(verbose)
  end

  def call()
    slcsp = SlcspData.new

    zips = ZipsData.new
    zips.load_and_build_zips_in_scope(slcsp.data)

    rate_aggregate = PlansData.new
    rate_aggregate.load_and_build_rates(zips)

    @log.info("zipcode,rate")
    slcsp.data.each{ |zip, values| @log.info rate_aggregate.data[zip].to_csv }
  end
end
