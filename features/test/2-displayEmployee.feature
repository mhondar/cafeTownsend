Feature: Employee List
    @automatic
    Scenario: Verifty user session is correct
        Given Open website "url"
        And Verify cafeTownsend open
        When I put my credencials "mhondar"
        And I click on Login button
        Then Verify Employees List Page is displayed
        And Verify user session is correct
    @automatic
    Scenario: Verifty Employees List is visible
        Given Open website "url"
        And Verify cafeTownsend open
        When I put my credencials "mhondar"
        And I click on Login button
        Then Verify Employees List Page is displayed
        And Verify Employees List is displayed
    
