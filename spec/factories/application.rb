FactoryBot.define do
    factory :application, class: 'Doorkeeper::Application' do
        name {"Test Application"}
        redirect_uri {""}
        scopes {""}
    end
end