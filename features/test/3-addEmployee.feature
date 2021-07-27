Feature: Create Employee

    @automatic
    Scenario Outline: Verify Create an Employee
        Given Open website "url"
        And Verify cafeTownsend open
        When I put my credencials "mhondar"
        And I click on Login button
        Then Verify Employees List Page is displayed
        When I click on Create button
        Then Verify Create Employee Page is displayed
        When I input de Fist name <FirstName>
        And I input Last name <LastName>
        And I input e-Mail <eMail>
        And I input Start date <StartDate>
        And I click on Save button
        Then Verify the employee was added

        Examples:
            | FirstName    | LastName | eMail                 | StartDate    |
            | "Marisleydi" | "Hondar" | "mhondar@hotmail.com" | "07/27/2021" |
            
    @automatic
    Scenario: Verify Cancel add an Employee
        Given Open website "url"
        And Verify cafeTownsend open
        When I put my credencials "mhondar"
        And I click on Login button
        Then Verify Employees List Page is displayed
        When I click on Create button
        Then Verify Create Employee Page is displayed
        And I click on Cancel button
        Then Verify Employees List Page is displayed

    Scenario Outline: Verify not Create an Employee with wrong data
        Given Open website "url"
        And Verify cafeTownsend open
        When I put my credencials "mhondar"
        And I click on Login button
        Then Verify Employees List Page is displayed
        When I click on Create button
        Then Verify Create Employee Page is displayed
        When I input de Fist name <FirstName>
        And I input Last name <LastName>
        And I input e-Mail <eMail>
        And I input Start date <StartDate>
        And I click on Save button
        Then Verify the employee was not added

        Examples:
            | FirstName    | LastName | eMail                 | StartDate       |
            | ""           | "Hondar" | "mhondar@hotmail.com" | "07/27/2021"    |
            | "Marisleydi" | ""       | "mhondar@hotmail.com" | "07/27/2021"    |
            | "Marisleydi" | "Hondar" | ""                    | "07/27/2021"    |
            | "Marisleydi" | "Hondar" | "mhondar@hotmail.com" | ""              |
            | "Marisleydi" | "Hondar" | "mhondarhotmail.com"  | "07/27/2021"    |
            | "Marisleydi" | "Hondar" | "mhondarhotmail.com"  | "27/07/2021"    |
            | "Marisleydi" | "Hondar" | "mhondarhotmail.com"  | "siete/07/2021" |