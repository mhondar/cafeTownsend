Feature: Edit Employee

    @automatic
    Scenario Outline: Verify Edit an Employee by Edit Button
        Given Open website "url"
        And Verify cafeTownsend open
        When I put my credencials "mhondar"
        And I click on Login button
        Then Verify Employees List Page is displayed
        And Select an Employed to be edited <Employee>
        When I click on Edit button
        Then Verify Create Employee Page is displayed
        When I input de Fist name <FirstName>
        And I input Last name <LastName>
        And I input e-Mail <eMail>
        And I input Start date <StartDate>
        And I click on Save button
        Then Verify the employee are in list

        Examples:
            | Employee          | FirstName    | LastName | eMail                 | StartDate    |
            | "Thomas Burleson" | "Marisleydi" | "Hondar" | "mhondar@hotmail.com" | "07/27/2021" |
    @automatic
    Scenario Outline: Verify Edit an Employee by Double Click on Employee
        Given Open website "url"
        And Verify cafeTownsend open
        When I put my credencials "mhondar"
        And I click on Login button
        Then Verify Employees List Page is displayed
        When I double click on Employee to be edited <Employee>
        Then Verify Create Employee Page is displayed
        When I input de Fist name <FirstName>
        And I input Last name <LastName>
        And I input e-Mail <eMail>
        And I input Start date <StartDate>
        And I click on Save button
        Then Verify the employee are in list

        Examples:
            | Employee          | FirstName    | LastName | eMail                 | StartDate    |
            | "Thomas Burleson" | "Marisleydi" | "Hondar" | "mhondar@hotmail.com" | "07/27/2021" |

    @automatic
    Scenario Outline: Verify Cancel Edit an Employee don´t make changes
        Given Open website "url"
        And Verify cafeTownsend open
        When I put my credencials "mhondar"
        And I click on Login button
        Then Verify Employees List Page is displayed
        When I double click on Employee to be edited <Employee>
        Then Verify Create Employee Page is displayed
        When I input de Fist name <FirstName>
        And I input Last name <LastName>
        And I input e-Mail <eMail>
        And I input Start date <StartDate>
        And I click on Cancel button on the top
        Then Verify Employee name on list <Employee>

        Examples:
            | Employee          | FirstName    | LastName | eMail                 | StartDate    |
            | "Thomas Burleson" | "Marisleydi" | "Hondar" | "mhondar@hotmail.com" | "07/27/2021" |
