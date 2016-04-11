source "http://rubygems.org"

gem "rspec", "~> 3.2.0"
gem "rspec-core", "~> 3.2.1"

gem "activerecord", "3.2.17"
gem "childprocess"
gem "syntax"
gem "systemu"
gem "hoe", "2.8.0"
#gem "builder", "2.1.2"
gem "net-ldap", "~> 0.8.0"  # Ruby 1.9
gem "plist"
#gem "ci_reporter"
gem "fastercsv"
# gem "spreadsheet"
# gem "mail", "2.5.3"  # 2.5.4 has issues with HTTPs with ruby 1.8
gem "i18n", "0.6.11" # 0.7 requires ruby 1.9.2
gem "r18n-desktop", "~> 1.1" 
gem "dbi"
gem "coderay"
# gem "json", "~>1.7.6"

if RUBY_PLATFORM =~ /darwin/
  gem "sqlite3-ruby", "1.2.5", :require => "sqlite"
else
	gem "sqlite3"
end

gem "launchy"
gem "httpclient"
gem "faker"
gem "xml-simple"

gem "ruby_parser", "2.3.1"
gem "sexp_processor", "~>3.0"
gem "ruby2ruby", "~>1.3.1"

# Native
# gem "mysql2", "0.3.11"
# gem "watir-webdriver"

# gem "rubyzip", "1.0.1" # hacked version, rubyzip > 1 not support ruby 1.8.7
gem "rubyzip", "0.9.9"

gem "commonwatir"

# gem "selenium-webdriver", "~> 2.35.1" # new version requires Ruby 1.9.2 + 
# gem "selenium-webdriver", :path =>"vendor/source/selenium-webdriver-2.42.0"
# gem "selenium-webdriver", :path =>"vendor/source/selenium-webdriver-2.43.0"
# gem "selenium-webdriver", :path =>"vendor/source/selenium-webdriver-2.44.0"
gem "selenium-webdriver", :path =>"vendor/source/selenium-webdriver-2.45.0"

=begin
vendor/bundle/ruby/1.8/gems/selenium-webdriver-2.37.0/lib/selenium/webdriver/common/zipper.rb:1:in `require': no such file to load -- zip (Load Error)

if RUBY_VERSION =~ /^1\.8/
  require 'zip/zip'
  Zip::File = Zip::ZipFile
  Zip::Entry = Zip::ZipEntry
else
  require 'zip'  
end
=end


if RUBY_PLATFORM =~ /darwin/
	#if ENV['TESTWISE_ENV'] == "test"
		# local development
	#	gem "nokogiri"
	#else
	  ## Source
	  #
	  # Arch 32
   gem "nokogiri", :path =>"vendor/source/darwin/gems/nokogiri-1.5.0"
	#end
  gem "wxruby", :require => "wx", :path =>"vendor/source/darwin/gems/wxruby-2.0.1-universal-darwin-9"
end

# Exclude: as no need, also saved watir click_no_wait command length
# gem "sanitize"
# gem "term-ansicolor"

gem "rwebspec", "~> 6.0.3" #, :path =>"vendor/source/rwebspec"
gem "minitest" #, "~> 4.0" # user add to test_helper to use it, RWebSpec 6 already includes own assertion

# JIRA SOAP Service, Ruby 1.9
# gem "jira4r", "0.3.0" # not working any more, using SOAP

# gem 'jiralicious' # use REST API
# gem "ruby-odbc"

gem "mime-types", "~> 1.25"
gem "rake"
gem "websocket", "1.1.4"

if RUBY_PLATFORM =~ /mingw/ 
  # gem "bundler", :path =>"vendor/source/mingw32/bundler-1.0.0"
  gem "bundler"	
  gem "rautomation"
  gem "watir", ">=5.0.0" #,  "2.0.4" #"3.0.0rc2"
  gem "watir-classic" # , "4.0.1" 
  gem "wxruby"
  gem "nokogiri",  "~> 1.5.9"
  gem "rformspec"
  gem "win32-api"
  gem "win32-ipc", "~> 0.5.0"
  gem "win32-mutex", "~>0.3.2" 
  gem "win32-open3-19"
  gem "win32-process", "~>0.6.6"
  gem "windows-api"
  gem "windows-pr"
  gem "eventmachine", "1.0.3" #1.0.4 failed to build

  gem "mini_magick" # , "3.2.1"
  gem "win32screenshot" #, "1.0.5" # because Rautomation, otherwise v1.0.7 works
  gem "rubysspi"
  gem "rb-fchange"
	gem "ffi", "1.9.0"
  gem ruby-debug   # added by Ming	
else
	gem "ffi"
  gem "rb-fsevent"
end

gem "os" # for geting information about process
gem "uuid"


# Cause background command window
# gem "git" # for Git integration
