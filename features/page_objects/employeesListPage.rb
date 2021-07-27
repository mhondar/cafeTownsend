class EmployeesListPage

    def initialize
        locators = JSON.parse(File.read("./features/locators/employeesList_locators.json"))
        @sesionUser = $driver.element(xpath: locators["sesionUser"])
        @employeeList = $driver.element(xpath: locators["employeeList"])
        @addButton = $driver.element(xpath: locators["addButton"])
        @editButton = $driver.element(xpath: locators["editButton"])
        @deleteButton = $driver.element(xpath: locators["deleteButton"])
        @logoutButoon = $driver.element(xpath: locators["logoutButoon"])
    end

    def verifyEmployeesListPage
        begin
            $tools.wait_element(@employeeList)
        rescue
            $tools.test_fail("Employees List Page isn´t visible")
        end
    end

    def verifyUserSession
        if @sesionUser.text == $userSession
            puts "User Session is verified"
        else
            $tools.test_fail("User Session isn´t correct")
        end
    end

    def verifyEmployeeList
        begin
            $tools.wait_element(@employeeList)
        rescue
            $tools.test_fail("Employees List isn´t visible")
        end
    end

    def clickCreateButton
        sleep 1
        $tools.click(@addButton)
    end

    def verifyNameOnEmployeeList(fullName)
        searchElement = $driver.element(xpath: '//ul[@id="employee-list"]/li[contains(text(), "' + fullName + '")]')
        begin
            $tools.wait_element(searchElement)
        rescue
            $tools.test_fail("Employee #{fullName} was not added")
        end
    end

    def verifyEmployeeAreInList
        fullName = $fistName + " " + $lastName
        verifyNameOnEmployeeList(fullName)
    end

    def selectEmployee(employee)
        employeeSelected = $driver.element(xpath: '//ul[@id="employee-list"]/li[contains(text(), "' + employee + '")]')
        $tools.click(employeeSelected)
    end

    def clickEditButton
        $tools.click(@editButton)
    end

    def doubleClickEmployee(employee)
        employeeSelected = $driver.element(xpath: '//ul[@id="employee-list"]/li[contains(text(), "' + employee + '")]')
        $tools.doubleClick(employeeSelected)
    end

    def verifyEmployee(employee)
        employeeSearched = $driver.element(xpath: '//ul[@id="employee-list"]/li[contains(text(), "' + employee + '")]')
        begin
            $tools.wait_element(employeeSearched)
        rescue
            $tools.test_fail("Employee #{employee} isn´t in list")
        end
    end

    def verifyEmployeeIsNotInList(employee)
        employeeSearched = $driver.element(xpath: '//ul[@id="employee-list"]/li[contains(text(), "' + employee + '")]')
        if $tools.verify_element(employeeSearched)
            $tools.test_fail("Employee #{employee} wasn´t deleted")
        else
            puts "Employee #{employee} was deleted"
        end
    end

    def clickDeleteButton
        $tools.click(@deleteButton)
    end

    def clickLogout
        $tools.click(@logoutButoon)
    end

end