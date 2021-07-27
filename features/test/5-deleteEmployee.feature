Feature: Delete Employee

    @automatic
    Scenario: Verify Delete Employee from Edit page
        Given Open website "url"
        And Verify cafeTownsend open
        When I put my credencials "mhondar"
        And I click on Login button
        Then Verify Employees List Page is displayed
        When I double click on Employee to be edited "Thomas Burleson"
        Then Verify Create Employee Page is displayed
        And I input Start date "01/01/2010"
        And I click on Delete button
        Then Verify Employee name isn´t in list "Thomas Burleson"

    @automatic
    Scenario: Verify Delete Employee from Employee List
        Given Open website "url"
        And Verify cafeTownsend open
        When I put my credencials "mhondar"
        And I click on Login button
        Then Verify Employees List Page is displayed
        And Select an Employed to be edited "Thomas Burleson"
        And I click on Delete button from Employee List
        Then Verify Employee name isn´t in list "Thomas Burleson"