require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Contact do
  before :each do
    @contact = Factory(:contact,
                       :title  => "Master Contact")
    @dup_contact = Factory(:contact,
                           :title  => "Duplicate Contact")
  end

  it "should send a POST request to a configured merge hook URL" do
    test_url = "http://www.example.com"
    Setting.service_hooks = {"merge_url" => test_url}
    Nestful.should_receive(:post).
            with(test_url, :format => :form,
                           :params => {
                              :merge => {
                                 :old_contact => {:id => @dup_contact.id},
                                 :new_contact => {:id => @contact.id, :name => @dup_contact.name}
                              }
                            })

    @dup_contact.merge_with(@contact)
  end
end

