require 'cybersource_rest_client'
require_relative './create-customer-payment-instrument-card.rb'
require_relative '../../../data/Configuration.rb'

public
class Delete_customer_payment_instrument
    def run()
        customer_token_id = "AB695DA801DD1BB6E05341588E0A3BDC"
        payment_instrument_token_id = (JSON.parse(Create_customer_payment_instrument_card.new.run()))['id']
        config = MerchantConfiguration.new.merchantConfigProp()
        api_client = CyberSource::ApiClient.new
        api_instance = CyberSource::CustomerPaymentInstrumentApi.new(api_client, config)

        data, status_code, headers = api_instance.delete_customer_payment_instrument(customer_token_id, payment_instrument_token_id)

        puts data, status_code, headers

        return data
    rescue StandardError => err
        puts err.message
    end
    if __FILE__ == $0
        Delete_customer_payment_instrument.new.run()
    end
end
