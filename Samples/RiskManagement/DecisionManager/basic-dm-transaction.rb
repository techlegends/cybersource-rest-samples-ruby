require 'cybersource_rest_client'
require_relative '../../../data/Configuration.rb'

public
class Basic_dm_transaction
    def run()
        request_obj = CyberSource::CreateBundledDecisionManagerCaseRequest.new
        client_reference_information = CyberSource::Riskv1decisionsClientReferenceInformation.new
        client_reference_information.code = "54323007"
        request_obj.client_reference_information = client_reference_information

        payment_information = CyberSource::Riskv1decisionsPaymentInformation.new
        card = CyberSource::Riskv1decisionsPaymentInformationCard.new
        card.number = "4444444444444448"
        card.expiration_month = "12"
        card.expiration_year = "2020"
        payment_information.card = card
        request_obj.payment_information = payment_information

        order_information = CyberSource::Riskv1decisionsOrderInformation.new
        amount_details = CyberSource::Riskv1decisionsOrderInformationAmountDetails.new
        amount_details.currency = "USD"
        amount_details.total_amount = "144.14"
        order_information.amount_details = amount_details
        bill_to = CyberSource::Riskv1decisionsOrderInformationBillTo.new
        bill_to.address1 = "96, powers street"
        bill_to.administrative_area = "NH"
        bill_to.country = "US"
        bill_to.locality = "Clearwater milford"
        bill_to.first_name = "James"
        bill_to.last_name = "Smith"
        bill_to.phone_number = "7606160717"
        bill_to.email = "test@visa.com"
        bill_to.postal_code = "03055"
        order_information.bill_to = bill_to
        request_obj.order_information = order_information

        config = MerchantConfiguration.new.merchantConfigProp()
        api_client = CyberSource::ApiClient.new
        api_instance = CyberSource::DecisionManagerApi.new(api_client, config)

        data, status_code, headers = api_instance.create_bundled_decision_manager_case(request_obj)

        puts data, status_code, headers
        return data
    rescue StandardError => err
        puts err.message
    end
    if __FILE__ == $0
        Basic_dm_transaction.new.run()
    end
end
