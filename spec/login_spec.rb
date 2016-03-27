load File.dirname(__FILE__) + '/../test_helper.rb'

describe "User Login" do
  include TestHelper

  before(:all) do
    @browser = $browser = Selenium::WebDriver.for(browser_type)
    @browser.navigate.to(site_url)
  end

  before(:each) do
    @browser.navigate.to(site_url)
  end
  
  after(:all) do
    @browser.quit unless debugging?
  end

  it "Can sign in OK" do
    @browser.find_element(:id, "username").send_keys("agileway")
    @browser.find_element(:id, "password").send_keys("testwise")
    @browser.find_element(:id, "username").submit
    # selenium does not have browser.text yet
    try_for(3) {  @browser.page_source.include?("Welcome").should == true }
    @browser.find_element(:link_text, "Sign off").click
    sleep 0.5 # let sign off to complete
  end

  it "User failed to sign in due to invalid password" do
    @browser.find_element(:id, "username").send_keys("agileway")
    @browser.find_element(:id, "password").send_keys("badpass")
    @browser.find_element(:id, "username").submit
    @browser.page_source.include?("Invalid email or password").should == true
  end

end
