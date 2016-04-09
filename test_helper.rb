require 'rubygems'
require 'selenium-webdriver'
require 'rspec'
require 'pry'
$TESTWISE_BROWSER = "ie"

# use utils in RWebSpec and better integration with TestWise
require "#{File.dirname(__FILE__)}/rwebspec_utils.rb"
require "#{File.dirname(__FILE__)}/testwise_support.rb"


# this loads defined page objects under pages folder
require "#{File.dirname(__FILE__)}/pages/abstract_page.rb"
Dir["#{File.dirname(__FILE__)}/pages/*_page.rb"].each { |file| load file }

# The default base URL for running from command line or continuous build process
$BASE_URL = "http://agiletravel.herokuapp.com"
$TESTWISE_PROJECT_BASE_URL="http://agiletravel.herokuapp.com"

# This is the helper for your tests, every test file will include all the operation
# defined here.
module TestHelper

  include RWebSpecUtils
  include TestWiseSupport

  def browser_type
    if $TESTWISE_BROWSER then
      $TESTWISE_BROWSER.downcase.to_sym
    else
      RUBY_PLATFORM =~ /mingw/ ? "ie".to_sym : "firefox".to_sym
	  
    end
  end
  alias the_browser browser_type

  def site_url(default = "http://agiletravel.herokuapp.com")
    $TESTWISE_PROJECT_BASE_URL || default
  end
	
  # got to path based on current base url
  def goto_page(path)
    @browser.navigate.to(site_url + path)
  end
  
end
