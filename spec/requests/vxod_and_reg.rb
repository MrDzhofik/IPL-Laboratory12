require 'selenium-webdriver'
require 'json'
RSpec.describe 'Authorization and registration test' do
    before(:each) do
        @driver = Selenium::WebDriver.for :firefox
        @driver.manage.window.maximize
    end
    after(:each) do
        sleep(5)
        @driver.quit
    end
    it 'should reg user' do
        @driver.get('http://localhost:3000/')
        @driver.find_element(:link_text, 'Новый гость').click
        @driver.find_element(:id, 'user_username').send_keys('gav')
        @driver.find_element(:id, 'user_email').send_keys('gav@example.ru')
        @driver.find_element(:id, 'user_password').send_keys('897654')
        @driver.find_element(:name, 'commit').click
        sleep(3)
        expect(@driver.find_element(:xpath, '//p[2]').text).to eq("User was successfully created.")
     end

     it 'should auth user' do
        @driver.get('http://localhost:3000/')
        @driver.find_element(:id, 'email').send_keys("djafarovemil04@mail.ru")
        @driver.find_element(:id, 'password').send_keys(123456)
        @driver.find_element(:name, 'commit').click
        sleep(3)
        expect(@driver.find_element(:xpath, '//p').text).to eq("Current user:MrDzhofik")
     end

    it 'without login' do
        @driver.get('http://localhost:3000/')
        sleep(3)
        expect(@driver.find_element(:xpath, '//p').text).to eq('Not logged in')
    end

    it 'kick without login' do
        @driver.get('http://localhost:3000/calc/input')
        sleep(3)
        expect(@driver.find_element(:xpath, '//p[3]').text).to eq('Леее, куда прешь брат без авторизации')
    end

end