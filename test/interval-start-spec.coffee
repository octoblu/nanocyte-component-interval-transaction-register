IntervalStart = require 'nanocyte-component-interval-register'
IntervalTransactionStart = require '..'

describe 'IntervalTransactionStart', ->
  beforeEach ->
    @sut = new IntervalTransactionStart {transactionId: 'some-transaction-id'}

  it 'should exist', ->
    expect(@sut).to.be.an.instanceOf IntervalStart

  describe '->onEnvelope', ->
    describe 'with repeat', ->
      describe 'when called with an envelope', ->
        beforeEach ->
          @result = @sut.onEnvelope
            message: 'whaaa?'
            config:
              repeat: 1000
              id: 'the-node-uuid'
              deviceId: 'some-hardcoded-uuid'
              nanocyte:
                nonce: 'i-am-a-nonce'

        it 'should return a message', ->
          expect(@result).to.deep.equal
            devices: ['some-hardcoded-uuid']
            topic: 'register-interval'
            payload:
              fireOnce: false
              intervalTime: 1000
              cronString: undefined
              nodeId: 'the-node-uuid'
              nonce: 'i-am-a-nonce'
              noUnsubscribe: undefined
              transactionId: 'some-transaction-id'
