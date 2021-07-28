Feature: Logout

    @automatic
    Scenario: Verify Logout
        Given Open website "url"
        And Verify cafeTownsend open
        When I put my credencials "mhondar"
        And I click on Login button
        Then Verify Employees List Page is displayed
        And I click on Logout button
        Then Verify cafeTownsend open