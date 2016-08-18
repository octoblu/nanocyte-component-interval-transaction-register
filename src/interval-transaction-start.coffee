IntervalStart = require 'nanocyte-component-interval-register'

class IntervalTransactionStart extends IntervalStart
  constructor: (@metadata) ->
    super @metadata

  onEnvelope: (envelope) =>
    response = super envelope
    response.payload.transactionId = @metadata.transactionGroupId

    return response

module.exports = IntervalTransactionStart
