import pyautogui
import time

def send_arrow_down_and_enter():
    time.sleep(1)  # small delay to let input box stay focused
    pyautogui.press('down')
    time.sleep(0.5)
    pyautogui.press('enter')
