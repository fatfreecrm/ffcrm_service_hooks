FactoryGirl.define do
  factory :contact do
    assigned_to         nil
    reports_to          nil
    first_name          { Faker::Name.first_name }
    last_name           { Faker::Name.last_name }
    access              "Public"
    title               nil
    department          nil
    source              nil
    email               { Faker::Internet.email }
    alt_email           { Faker::Internet.email }
    phone               { Faker::PhoneNumber.phone_number }
    mobile              { Faker::PhoneNumber.phone_number }
    fax                 { Faker::PhoneNumber.phone_number }
    do_not_call         false
    born_on             "1992-10-10"
    background_info     { Faker::Lorem.paragraph[0,255] }
    deleted_at          nil
    updated_at          { FactoryGirl.generate(:time) }
    created_at          { FactoryGirl.generate(:time) }
    cf_vend_customer_id nil
  end

end
