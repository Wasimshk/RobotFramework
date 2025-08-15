from time import sleep

from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn
import os


@library
class Shop:
    def __init__(self):
        pass
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

    # @keyword
    # def check_folder_empty_and_log(self, folder_path, output_file):
    #     found_files = []
    #     for root, dirs, files in os.walk(folder_path):
    #         for file in files:
    #             found_files.append(os.path.join(root, file))
    #
    #     with open(output_file, 'w', encoding='utf-8') as f:
    #         for file in found_files:
    #             f.write(file + '\n')
    #
    #     return len(found_files) == 0



