from robot.api.deco import library, keyword
from pywinauto import Application
import os
import time

@library
class DesktopLibrary:
    # def __init__(self):
    @keyword
    def launch_installer(self, installer_path):
        app = Application(backend="win32").start(installer_path)
        time.sleep(10)  # Adjust based on installer launch time
        return app

    @keyword
    def wait_until_installation_complete(self, exe_path, timeout=120):
        start_time = time.time()
        while time.time() - start_time < timeout:
            if os.path.isfile(exe_path):
                return True
            time.sleep(5)
        raise FileNotFoundError(f"Installation not completed in {timeout} seconds: {exe_path} not found")

    @keyword
    def launch_notepadpp(self, exe_path):
        app = Application(backend="win32").start(exe_path)
        time.sleep(3)
        return app

    @keyword
    def type_and_save_file(self, app, text, file_path):
        notepad_window = app.window(title_re=".*Notepad\\+\\+.*")
        notepad_window.wait('visible')
        notepad_window.type_keys(text, with_spaces=True)
        notepad_window.type_keys('^s')  # Ctrl+S to save
        save_dialog = app.window(title_re=".*Save.*|.*Save As.*")
        save_dialog.type_keys(file_path, with_spaces=True)
        save_dialog.type_keys('{ENTER}')
        time.sleep(2)

    @keyword
    def read_file_content(self, file_path):
        with open(file_path, 'r', encoding='utf-8') as file:
            return file.read()
