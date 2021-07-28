Feature: Login
    @automatic
    Scenario: Successfull Login
        Given Open website "url" "TC-01"
        And Verify cafeTownsend open
        When I put my credencials "mhondar"
        And I click on Login button
        Then Verify Employees List Page is displayed

    Scenario: Unsuccesfull Login for bad password
        Given Open website "url" "TC-02"
        And Verify cafeTownsend open
        When I put my credencials "mhondar_fail"
        And I click on Login button
        Then Verify Unsuccessfull Login