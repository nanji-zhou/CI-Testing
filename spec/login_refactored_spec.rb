load File.dirname(__FILE__) + '/../test_helper.rb'

describe "User Login_Refactored" do
  include TestHelper

  before(:all) do
    @browser = $browser = Selenium::WebDriver.for(browser_type)
    @browser.navigate.to(site_url)
  end

  after(:all) do
    @browser.quit unless debugging?
	
  end

  it "zml Can sign in OK" do
    goto_page("/login")
    login_page = LoginPage.new(@browser)
    login_page.login("agileway", "testwise")  
    # selenium does not have browser.text yet
    try_for(3) {  @browser.page_source.include?("WelcomeX").should == true }
    @browser.find_element(:link_text, "Sign off").click
  end

  it "User failed to sign in due to invalid password" do
    goto_page("/login")
    login_page = LoginPage.new(@browser)
    login_page.login("agileway", "badpass")
    @browser.page_source.include?("Invalid email or password").should == true
  end

end
