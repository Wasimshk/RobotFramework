*** Settings ***
Library    ../libraries/desktop_library.py

*** Variables ***
${EXE_PATH}          C:/Program Files/Notepad++/notepad++.exe
${TEXT_FILE_PATH}    C:/Users/Wasim Shaikh/Documents/testfile.txt
${TEXT_CONTENT}      Hello, World!
${Installer_path}    C:/WasimShaikh/Projects/RobotFramework/DesktopAutomation/installers/notepadpp_installer.exe

*** Test Cases ***
Automate Notepad++
#    installation is having some privilege issues
#    Launch Installer    ${Installer_path}
#    Wait Until Installation Complete    ${EXE_PATH}
    ${app}=    Launch Notepadpp    ${EXE_PATH}
    Type And Save File    ${app}    ${TEXT_CONTENT}    ${TEXT_FILE_PATH}
    ${file_content}=    Read File Content    ${TEXT_FILE_PATH}
    Should Contain    ${file_content}    ${TEXT_CONTENT}
