PROJECT_NAME = "AppSeat"
CONFIGURATION = "Debug"
UI_SPECS_TARGET_NAME = "Specs"
SDK_DIR = "/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator4.3.sdk"
SIMULATOR_SDK = "iphonesimulator4.3"

require 'rubygems'
require 'bundler'
Bundler.require(:default)
require 'erb'

BetaBuilder::Tasks.new do |config|
  config.target = "iOSExample"
  config.configuration = "Release"

  config.deploy_using(:testflight) do |tf|
    tf.api_token  = "3fdc0f4eede4e679c6eee8376237200c_ODk3NA"
    tf.team_token = "c13156a29bd444125222438c6326d85a_MTEyMzc"
  end
end

def build_dir(effective_platform_name)
  File.join(File.dirname(__FILE__), "build", CONFIGURATION + effective_platform_name)
end

def system_or_exit(cmd, stdout = nil)
  puts "Executing #{cmd}"
  cmd += " >#{stdout}" if stdout
  system(cmd)
  # Tolerate code sign errors
  raise "*** Build Failed ***" if ($? != 11 && $? != 0)
end

task :default => :specs

desc "CI Task"
task :ci do
  Rake::Task[:clean].invoke
  Rake::Task[:specs].invoke
end

desc "Clean Specs targets"
task :clean do
  stdout = File.join(ENV['CC_BUILD_ARTIFACTS'], "clean.output") if (ENV['IS_CI_BOX'])
  system_or_exit(%Q[xcodebuild -project #{PROJECT_NAME}.xcodeproj -target #{UI_SPECS_TARGET_NAME} -configuration #{CONFIGURATION} clean], stdout)
end

task :build_specs do
  stdout = File.join(ENV['CC_BUILD_ARTIFACTS'], "build_specs.output") if (ENV['IS_CI_BOX'])
  system_or_exit(%Q[xcodebuild -project #{PROJECT_NAME}.xcodeproj -sdk iphonesimulator4.2 -target #{UI_SPECS_TARGET_NAME} -configuration #{CONFIGURATION} build])
end

require 'tmpdir'
desc "Run UI Specs"
task :specs => :build_specs

namespace :xcode do
  desc 'Install source file templates which will override those of XCode'
  task :install_xcode4_templates do
    base_template_dir = "#{ENV['HOME']}/Library/Developer/Xcode/Templates/File Templates"
    ao_template_dir = "#{base_template_dir}/Atomic"
    mkdir_p base_template_dir
    rm_rf ao_template_dir
    sh "cp -R 'tools/xcode_templates/Atomic' '#{ao_template_dir}'"
  end
end
