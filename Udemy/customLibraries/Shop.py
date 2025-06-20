from time import sleep

from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn


@library
class Shop:
    def __init__(self):
        self.selLib = BuiltIn().get_library_instance("SeleniumLibrary")
        self.colLib = BuiltIn().get_library_instance("Collections")

    @keyword
    def hello_world(self):
        print("Hello, world!")
    @keyword
    def add_items_to_cart_and_checkout(self, productList):
        i = 1
        productsTitles = self.selLib.get_webelements("css:.card-title")
        for productsTitle in productsTitles:
            if productsTitle.text in productList:
                self.selLib.click_button("xpath:(//*[@class='card-footer'])["+ str(i) +"]/button")
            i = i + 1
        sleep(10)
#         ${elements}=    Get WebElements    css:.card-title



