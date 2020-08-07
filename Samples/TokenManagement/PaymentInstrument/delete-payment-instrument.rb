require 'cybersource_rest_client'
require_relative './create-payment-instrument-card.rb'
require_relative '../../../data/Configuration.rb'

public
class Delete_payment_instrument
    def run(profileid)
        token_id = (JSON.parse(Create_payment_instrument_card.new.run(profileid)))['id']
        config = MerchantConfiguration.new.merchantConfigProp()
        api_client = CyberSource::ApiClient.new
        api_instance = CyberSource::PaymentInstrumentApi.new(api_client, config)

        data, status_code, headers = api_instance.delete_payment_instrument(token_id, profileid)

        puts data, status_code, headers
        return data
    rescue StandardError => err
        puts err.message
    end
    if __FILE__ == $0
        profileid = '93B32398-AD51-4CC2-A682-EA3E93614EB1'

        Delete_payment_instrument.new.run(profileid)
    end
end
