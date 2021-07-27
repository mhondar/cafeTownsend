require 'date'

class Tools
   
    def open_page(url)
        count = 0
        $driver.goto url
        begin
            $driver.wait
        rescue Selenium::WebDriver::Error::UnknownError
            $driver.refresh
            count +=1
            if count < 3
                retry
            else
                $tools.fallo("Net Error")
            end 
        end
    end

    def wait_element(element)
        element.wait_until(&:present?)
    end

    def test_fail(menssage)
        $tools.save_screenshot("Fail", "features/screenshots/fails/")
        fail(menssage)
    end

    def click(element)
        wait_element(element)
        element.click
    end

    def doubleClick(element)
        wait_element(element)
        element.double_click
    end

    def clear_input(element)
        element.double_click
        $driver.send_keys :delete
    end

    def insert_text(element, text)
        wait_element(element)
        element.send_keys text
    end
    


    def back
        $driver.back
    end
    


    def hover(element)
        wait_element(element)
        if (element.exists? && element.present?)
            element.hover
        end
    end



    def wait_after_timeout(element)
        element.wait_element_timeout(element, 30)
    end

    def wait_element_timeout(element, time)
        element.wait_until(timeout: time, &:present?)
    end


    def scroll(element)
        element.scroll_into_view
    end

    def create_wait_element(xpath)
        element = $driver.element(xpath: xpath)
        element.wait_until(&:present?)
    end



    def verify_element(element)
        if element.present?
            return true
        else
            return false
        end
    end

    def insert_text_wait_tab(text, elem_textfield)
        click(elem_textfield)
        elem_textfield.send_keys text
        sleep 10
        $driver.send_keys :tab
        sleep 2
    end

    def select_option(element,option)
        wait_element(element)
        element.select(option)
    end

    def select_value(element,value)
        wait_element(element)
        element.select_value(value)
    end

    def wait_enabled(element)
        while !element.enabled?
            sleep 1
        end
    end

    def get_attribute_value(element,attribute)
        element.attribute_value(attribute)
    end

    def select_checkbox(element)
        wait_element(element)
        element.set
    end

    def unselect_checkbox(element)
        wait_element(element)
        element.clear
    end

    def select_random_select_option(list_options)
       wait_element(list_options)
       list_opcions.options.select(&:enabled?).sample.click
    end

    def save_screenshot(step, path)
        if $screenshots == "true"
            puts "Save Screenshot #{step}"
            ask_and_create_directory(path)
            filename = $name + "_" + step + "_" + $browser + "_" + filename_time
            directory = path + filename + ".png"
            $driver.screenshot.save(directory)
        end
    end

    def ask_and_create_directory(path)
        unless File.directory?(path)
            FileUtils.mkdir_p(path)
        end
    end

    def filename_time
        time_now = Time.now.to_s
        file_name = time_now[0..18]
        file_name[10] = "_"
        file_name[13] = "H"
        file_name[16] = "M"
        file_name[19] = "S"
        return file_name
    end



end
