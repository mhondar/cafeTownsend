Given('Open website {string}') do |url|
    @loginPage = LoginPage.new
    @loginPage.open_page(url)
  end

  Given('Verify cafeTownsend open') do
    @loginPage.verifyCafeTownsendPageOpen
  end
  
  When('I put my credencials {string}') do |user|
    @loginPage.insertCredentials(user)
  end
  
  When('I click on Login button') do
    @loginPage.clickLoginButton
  end
  
  Then('Verify Successfull Login') do
    @loginPage.verifySuccessLogin
  end