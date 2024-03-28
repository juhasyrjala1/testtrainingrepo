*** Settings ***
Library    Dialogs

*** Test Cases ***
Kysy Käyttäjätiedot
    ${name}=    Get Value From User    Anna nimesi
    ${choices}=    Create List    Vaihtoehto 1    Vaihtoehto 2    Vaihtoehto 3
    ${selected}=    Get Selection From User    Valitse vaihtoehto    @{choices}
    Log    Käyttäjän antama nimi: ${name}
    Log    Käyttäjän valitsema vaihtoehto: ${selected}
    Run Keyword If    '${selected}' == 'Vaihtoehto 1'    Log    Valitsit vaihtoehdon 1
    ...    ELSE IF    '${selected}' == 'Vaihtoehto 2'    Log    Valitsit vaihtoehdon 2
    ...    ELSE    Log    Valitsit vaihtoehdon 3