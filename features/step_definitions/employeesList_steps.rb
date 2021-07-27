Then('Verify Employees List Page is displayed') do
    @employeesList = EmployeesListPage.new
    @employeesList.verifyEmployeesListPage
  end

  Then('Verify user session is correct') do
    @employeesList.verifyUserSession
  end

  Then('Verify Employees List is displayed') do
    @employeesList.verifyEmployeeList
  end

  Then('I click on Create button') do
    @employeesList.clickCreateButton
  end

  Then('Verify the employee are in list') do
    @employeesList.verifyEmployeeAreInList
  end

  Then('Select an Employed to be edited {string}') do |employee|
    @employeesList.selectEmployee(employee)
  end

  When('I click on Edit button') do
    @employeesList.clickEditButton
  end

  Then('I double click on Employee to be edited {string}') do |employee|
    @employeesList.doubleClickEmployee(employee)
  end

  Then('Verify Employee name on list {string}') do |employee|
    @employeesList.verifyEmployee(employee)
  end

  Then('Verify Employee name isn´t in list {string}') do |employee|
    @employeesList.verifyEmployeeIsNotInList(employee)
  end

  When('I click on Delete button from Employee List') do
    @employeesList.clickDeleteButton
  end

  When('I click on Logout button') do
    @employeesList.clickLogout
  end

 
  
