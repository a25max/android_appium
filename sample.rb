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
    appPackage: "#{app_package}"
  }
}

@driver = Appium::Driver.new(capability, true)
@driver.start_driver
Appium.promote_appium_methods Object

# 利用規約同意する画面
find_element(:id, "#{app_package}:id/accept_button").click

# 認証画面内にある「すでにアカウントをお持ちの方はこちら」
find_element(:id, "#{app_package}:id/button_sign_in").click

find_element(:id, "#{app_package}:id/email_address").send_keys("carrier@ca.com")
find_element(:id, "#{app_package}:id/password").send_keys("asdfasdf")
find_element(:id, "#{app_package}:id/sign_in").click
sleep(30000)
@driver.driver_quit
