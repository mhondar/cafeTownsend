class CreateEmployeePage

    def initialize
        locators = JSON.parse(File.read("./features/locators/createEmployee_locators.json"))
        @employeeEditForm = $driver.element(xpath: locators["employeeEditForm"])
        @firstNameInput = $driver.element(xpath: locators["firstNameInput"])
        @lastNameInput = $driver.element(xpath: locators["lastNameInput"])
        @emailInput = $driver.element(xpath: locators["emailInput"])
        @startDateInput = $driver.element(xpath: locators["startDateInput"])
        @savebutton = $driver.element(xpath: locators["savebutton"])
        @cancelButoon = $driver.element(xpath: locators["cancelButoon"])
        @cancelButoonTop = $driver.element(xpath: locators["cancelButoonTop"])
        @deleteButoon = $driver.element(xpath: locators["deleteButoon"])
    end

    def verifyCreateEmployeePage
        begin
            $tools.wait_element(@employeeEditForm)
        rescue
            $tools.test_fail("Create Employees Page isn´t visible")
        end
    end

    def inputFirstName(firstName)
        $fistName = firstName
        $tools.clear_input(@firstNameInput)
        $tools.insert_text(@firstNameInput, firstName)
    end

    def inputLastName(lastName)
        $lastName = lastName
        $tools.clear_input(@lastNameInput)
        $tools.insert_text(@lastNameInput, lastName)
    end

    def inputEMail(eMail)
        7.times { $tools.clear_input(@emailInput) }
        $tools.insert_text(@emailInput, eMail)
    end

    def inputStartDate(startDate)
        sleep 1
        5.times { $tools.clear_input(@startDateInput) }
        sleep 1
        $tools.insert_text(@startDateInput, startDate)
    end

    def clickSaveButton
        $tools.click(@savebutton)
    end

    def clickCancelButton
        $tools.click(@cancelButoon)
    end

    def clickCancelButtonTop
        $tools.click(@cancelButoonTop)
    end

    def clickDeleteButton
        $tools.click(@deleteButoon)
    end

end