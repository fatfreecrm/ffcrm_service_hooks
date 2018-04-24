require 'rails_helper'

describe 'Contact' do

  let(:contact) { FactoryBot.create(:contact, title: "Master Contact") }
  let(:dup_contact) { FactoryBot.create(:contact, title: "Duplicate Contact") }

  it "should send a POST request to a configured merge hook URL" do
    test_url = "http://www.example.com"
    Setting.service_hooks = {"merge_url" => test_url}
    expect(Nestful).to receive(:post).
            with(test_url, :format => :form,
                           :params => {
                              :merge => {
                                 :old_contact => {:id => dup_contact.id},
                                 :new_contact => {:id => contact.id, :name => dup_contact.name}
                              }
                            })

    dup_contact.merge_with(contact)
  end
end

