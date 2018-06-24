# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'
use_frameworks!

def rx_swift
    pod 'RxSwift'
end

def query
    pod 'QueryKit'
end

target 'CoreDataPlatform' do

  rx_swift
  query


  target 'CoreDataPlatformTests' do
    inherit! :search_paths
    # Pods for testing
  end

end

target 'Domain' do

  rx_swift
  query

  target 'DomainTests' do
    inherit! :search_paths
    # Pods for testing
  end

end

target 'Workspaces' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Workspaces

  target 'WorkspacesTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'WorkspacesUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
