import time
from time import sleep

import pyautogui
from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn

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
