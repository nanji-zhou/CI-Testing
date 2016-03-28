load File.dirname(__FILE__) + '/../test_helper.rb'

describe "Payment" do
  include TestHelper

  before(:all) do
    @browser = $browser = Selenium::WebDriver.for(:ie)
    @browser.navigate.to(site_url)
  end

  after(:all) do
    @browser.quit unless debugging?
  end

  it "Book flight with payment" do
    @browser.find_element(:id, "username").send_keys("agileway")
    @browser.find_element(:id, "password").send_keys("testwise")
    @browser.find_element(:xpath,"//input[@value='Sign in']").click
    @browser.find_elements(:name => "tripType").each { |elem| elem.click && break if elem.attribute("value") == "oneway" && elem.attribute("type") == "radio" }
    # one way of using select in selenium: slow
    select_elem = @browser.find_element(:name, "fromPort");
    options = select_elem.find_elements(:tag_name, "option");
    options.each { |opt| opt.click if opt.text == "New York"}
    
    Selenium::WebDriver::Support::Select.new(@browser.find_element(:name, "toPort")).select_by(:text, "Sydney")
    Selenium::WebDriver::Support::Select.new(@browser.find_element(:id, "departDay")).select_by(:text, "04")
    Selenium::WebDriver::Support::Select.new(@browser.find_element(:id, "departMonth")).select_by(:text, "March 2012")

    @browser.find_element(:xpath,"//input[@value='Continue']").click
    @browser.find_element(:name, "passengerFirstName").send_keys("Wise")
    @browser.find_element(:name, "passengerLastName").send_keys("Tester")
    @browser.find_element(:xpath,"//input[@value='Next']").click
    @browser.find_elements(:name => "card_type").each { |elem| elem.click && break if elem.attribute("value") == "visa" && elem.attribute("type") == "radio" }
    @browser.find_element(:name, "card_number").send_keys("4000000000000000")
    select_elem = @browser.find_element(:name, "expiry_year");
    options = select_elem.find_elements(:tag_name, "option");
    options.each { |opt| opt.click if opt.text == "2013"}
    @browser.find_element(:xpath,"//input[@value='Pay now']").click
    try_for(10) { @browser.page_source.include?("2012-03-04   <b>New York</b> to <b>Sydney</b>").should == true }
  end

end
