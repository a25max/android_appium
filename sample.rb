require 'appium_lib'

capability = {
  caps: {
    automationName: 'uiautomator2',
    platformName: 'Android',
    disableWindowAnimation: true,
    deviceName: 'Nexus',
    app: ENV['APP_PATH'] || "./#{Dir['*.apk'].last}",
    unicodeKeyboard: true,
    newCommandTimeout: 300,
    appPackage: "jp.co.nikko_data.japantaxi",
    appActivity: ".activity.SignInActivity",
    autoGrantPermissions: true
  }
}

@driver = Appium::Driver.new(capability, true).start_driver
Appium.promote_appium_methods Object

email_address_id = "jp.co.nikko_data.japantaxi:id/email_address"
password_id = "jp.co.nikko_data.japantaxi:id/password"
signin_id = "jp.co.nikko_data.japantaxi:id/sign_in"
find_elements(:id, email_address_id).first.send_keys("carrier@ca.com")
find_elements(:id, password_id).first.send_keys("asdfasdf")
find_elements(:id, signin_id).first.click

@driver.driver_quit
