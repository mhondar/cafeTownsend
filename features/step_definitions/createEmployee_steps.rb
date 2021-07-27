Then('Verify Create Employee Page is displayed') do
    @createEmployee = CreateEmployeePage.new
    @createEmployee.verifyCreateEmployeePage
  end

  When('I input de Fist name {string}') do |firstName|
    @createEmployee.inputFirstName(firstName)
  end
  
  When('I input Last name {string}') do |lastName|
    @createEmployee.inputLastName(lastName)
  end
  
  When('I input e-Mail {string}') do |eMail|
    @createEmployee.inputEMail(eMail)
  end
  
  When('I input Start date {string}') do |startDate|
    @createEmployee.inputStartDate(startDate)
  end
  
  When('I click on Save button') do
    @createEmployee.clickSaveButton
  end

  When('I click on Cancel button') do
    @createEmployee.clickCancelButton
  end

  When('I click on Cancel button on the top') do
    @createEmployee.clickCancelButtonTop
  end

  When('I click on Delete button') do
    @createEmployee.clickDeleteButton
  end




  
