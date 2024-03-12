*** Settings ***
Library    SeleniumLibrary

Resource    PO/AddCustomer.robot
Resource    PO/Home.robot
Resource    PO/LandingPage.robot
Resource    PO/Customers.robot
Resource    PO/SignIn.robot
Resource    PO/LoggedOut.robot

Resource    PO/LandingPage.robot
Resource    PO/TopNav.robot
Resource    PO/LoginForm.robot

*** Keywords ****

Go to "Home" page
    Home.Navigate To
    Home.Verify Page Loaded
    
Login With Valid Credentials
    [Arguments]    ${Email}    ${Password}
    TopNav.Click "Sign In" Link
    Signin.Verify Page Loaded
    SignIn.Login With Valid Credentials    ${Email}   ${Password}
    Customers.Verify Page Loaded

Add New Customer
    Customers.Click "Add Customer" Link
    AddCustomer.Verify Page Loaded
    AddCustomer.Add New Customer
    Customers.Verify Customer Added Successfully
Sign Out
    TopNav.Click "Sign Out" Link
    LoggedOut.Verify Page Loaded   
