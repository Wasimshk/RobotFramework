*** Settings ***
Library    OperatingSystem
Library    BuiltIn
Library    ../customLibraries/Shop.py

*** Variables ***
${TARGET_FOLDER}     C:\\WasimShaikh\\empty test
${OUTPUT_FILE}       C:\\WasimShaikh\\folder_check_result.txt

*** Test Cases ***
Validate if installation path is empty
    ${is_empty}=    Check Folder Empty And Log    ${InstallPath}    ${OUTPUT_FILE}
    Run Keyword Unless    ${is_empty}    Fail    Folder is not empty. See ${OUTPUT_FILE}
    Log    Folder is empty. Test Passed.