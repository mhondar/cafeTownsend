class LoginPage

    def initialize 
        locators = JSON.parse(File.read("./features/locators/login_locators.json"))
        @loginForm = $driver.element(xpath: locators["loginForm"])
        @inputUser = $driver.element(xpath: locators["inputUser"])
        @inputPass = $driver.element(xpath: locators["inputPass"])
        @buttonLogin = $driver.element(xpath: locators["buttonLogin"])
    end

    def open_page(url)
        url_json = JSON.parse(File.read("./features/data/url.json"))    
        url = url_json[url]
        $tools.open_page(url)
    end

    def verifyCafeTownsendPageOpen
        begin
            $tools.wait_element(@loginForm)
        rescue
            $tools.test_fail("CafeTownsend doesn´t open")
        end
    end

    def insertCredentials(user)
        usersData = JSON.parse(File.read("./features/data/users.json"))
        $userSession = usersData[user]["username"]
        $tools.insert_text(@inputUser, usersData[user]["username"])
        $tools.insert_text(@inputPass, usersData[user]["password"])
    end

    def clickLoginButton
        $tools.click(@buttonLogin)
    end

end