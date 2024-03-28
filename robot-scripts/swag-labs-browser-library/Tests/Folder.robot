*** Settings ***
Documentation    This suite tests Swag Labs Demo UI site
Library    OperatingSystem
Library    BuiltIn



# robot -d Results tests\Swag_Labs1.robot

*** Variables ***
${folder_path} =         C:/development/robot-scripts/swag-labs/FolderTest
${file_content} =        This is the text inside
${file_path} =           ${folder_path}/${original_file}
${original_file} =       testfile.txt

${source_file} =         ${folder_path}/${original_file}
${destination_folder} =  C:/development/robot-scripts/swag-labs/FolderTest2
${destination_file} =    ${destination_folder}/tiedosto2.txt


*** Test Cases ***

Create Folder And File

    Create Directory    ${folder_path}
    Create File         ${file_path}    ${file_content}

    ${file_exists} =    Run Keyword And Return Status    File Should Exist    ${file_path}  
    ${content} =        Get File    ${file_path}
    Should Be Equal       ${content}    ${file_content}

Kopioi tiedosto
    
    ${file_exists} =   Run Keyword And Return Status    File Should Exist    ${source_file}
    Run Keyword If    '${file_exists}' == 'True'    Copy File    ${source_file}    ${destination_file}
    ...    ELSE    Create File    ${source_file}