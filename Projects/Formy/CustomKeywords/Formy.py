import time
from time import sleep

import pyautogui
from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.common.keys import Keys

@library
class Formy:
    def __init__(self):
        self.selLib = BuiltIn().get_library_instance("SeleniumLibrary")

    @keyword
    def send_arrow_down_and_enter(self):
        time.sleep(1)
        pyautogui.press('down')
        time.sleep(0.5)
        pyautogui.press('enter')

    @keyword
    def press_buttons_of_choice(self, locator, buttonsList):
        # products = self.selLib.get_webelements("css:.card-title")
        buttonsElem = self.selLib.get_webelements("xpath:" + locator)
        i = 1
        for button in buttonsElem:
            if button.text in buttonsList:
                self.selLib.click_button('xpath:(' + locator + ')['+str(i)+']')
                print(button.text + " button is Clicked!")
            i = i + 1

    @keyword
    def drag_and_drop_action(self, source_xpath, target_xpath):
        driver = self.selLib.driver
        source = driver.find_element("xpath", source_xpath)
        target = driver.find_element("xpath", target_xpath)
        ActionChains(driver).drag_and_drop(source, target).perform()

    @keyword
    def ctrl_click(self, xpath):
        driver = self.selLib.driver
        link = driver.find_element("xpath", xpath)
        ActionChains(driver) \
            .key_down(Keys.CONTROL) \
            .click(link) \
            .key_up(Keys.CONTROL) \
            .perform()
