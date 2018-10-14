require 'appium_lib'

app_package = "jp.co.nikko_data.japantaxi.dev"

capability = {
  caps: {
    automationName: 'UiAutomator2',
    platformName: 'Android',
    disableWindowAnimation: false,
    deviceName: 'Nexus',
    app: ENV['APP_PATH'] || "./#{Dir['*.apk'].last}",
    unicodeKeyboard: false,
    newCommandTimeout: 300,
    appPackage: "#{app_package}",
    appActivity: "jp.co.nikko_data.japantaxi.activity.SignInActivity"
  }
}

@driver = Appium::Driver.new(capability, true)
@driver.start_driver
@driver.set_network_connection(2)
Appium.promote_appium_methods Object

# find_element(:id, "com.google.android.gms:id/cancel").click

find_element(:id, "#{app_package}:id/email_address").send_keys("carrier@ca.com")
find_element(:id, "#{app_package}:id/password").send_keys("asdfasdf")
find_element(:id, "#{app_package}:id/sign_in").click
sleep(30)
@driver.driver_quit
