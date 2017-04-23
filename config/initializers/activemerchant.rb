if Rails.env == "development"
  ActiveMerchant::Billing::FirstdataE4Gateway.wiredump_device = File.open(Rails.root.join("log","active_merchant.log"), "a+")
  ActiveMerchant::Billing::FirstdataE4Gateway.wiredump_device.sync = true
  ActiveMerchant::Billing::Base.mode = :test

  login = Rails.application.secrets.firstdatae_login
  password = Rails.application.secrets.firstdatae_password
elsif Rails.env == "production"
  login = Rails.application.secrets.firstdatae_login
  password = Rails.application.secrets.firstdatae_password
end

GATEWAY = ActiveMerchant::Billing::FirstdataE4Gateway.new({
  login: login,
  password: password
})
