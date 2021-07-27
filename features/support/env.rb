require 'rubygems'
require 'watir'
require 'yaml'
require 'fileutils'
require 'json'
require 'csv'
require 'time'
require 'base64'
require 'report_builder'
require './features/tools/Tools.rb'

def init_global_var
    $tools = Tools.new                        #objeto de herramientas comunes
    $name = "Nil"
    $environment = "Nil"
    $imgs = ENV['ATTACH']
    $report = ENV['REPORT']
    $project = ENV['PROJECT']
    $screenshots = ENV['SCREENSHOT']
    $end = false
    $tools.ask_and_create_directory("features/reports/json")
    $tools.ask_and_create_directory("features/reports/report_builder")
end

Before do
    init_global_var
    $driver = get_driver
    Watir.default_timeout = 60
    $driver.driver.manage.window.maximize
end

After do |scenario|
    $tools = Tools.new
    if scenario.failed?
        $tools.save_screenshot("Fail", "features/screenshots/fails/")
        if $imgs
            atash_images
        end
    else 
        if($imgs && $end)
            atash_images
        end
        $tools.save_screenshot('Pass', 'features/screenshots/pass/')
    end
    $tools.save_screenshot("End", "features/screenshots/fin_script/")
    if ENV['CLOSE'] == "true"
        $driver.close
    end
end

at_exit do
    puts "Exit"
    puts ENV['REPORT']
    if ENV['REPORT'] == "true"
        puts "report"
        generate_report_builder
        FileUtils.rm_rf(Dir.glob('features/reports/json/*'))
    end  
end

def atash_images
    encoded_img = $driver.screenshot.base64
    embed("data:image/png;base64,#{encoded_img}",'image/png')
end

def generate_report_builder
    puts "Generate Report Builder"
    unless File.directory?('features/reports/report_builder')
        FileUtils.mkdir_p('features/reports/report_builder')
    end 
    time = DateTime.now.to_s.gsub(':', '_')
    $report_name = 'report_builder_' + $project + '_' + $browser + '_' + time
    ReportBuilder.input_path = 'features/reports/json'
    ReportBuilder.configure do |config|
        config.report_path = 'features/reports/report_builder/' + $report_name
        config.report_types = [:json, :html]
        config.report_title = 'Automatic Test Report' + $project
        config.additional_info = {browser: $browser, environment: $environment}
        config.include_images = true
        config.color = 'green'
      end
      ReportBuilder.build_report
end

def get_driver
    $browser = ENV['BROWSER']
    case $browser
        when "safari"
            return  Watir::Browser.new :safari, technology_preview: true
        when "firefox"
            return  Watir::Browser.new :firefox
        when "chrome"
            return  Watir::Browser.new :chrome , options: {options: {detach: true}}
        when "ie"
            return  Watir::Browser.new :ie
        when "RemoteFirefox" 
            return Watir::Browser.new :firefox, {takesScreenshot: true, acceptInsecureCerts: false , timeout: 120, url: "http://0.0.0.0:4444/wd/hub"}
        when "RemoteChrome"
            return  Watir::Browser.new :chrome, {takesScreenshot: true, acceptInsecureCerts: false , timeout: 120, url: "http://0.0.0.0:4444/wd/hub"} 
    end
end
  