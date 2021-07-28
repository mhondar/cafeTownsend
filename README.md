# cafeTownsend

The web app that needs to be tested is available under the following link:
http://thomasburleson.github.io/angularJS-CafeTownsend/#/login
## Features of the application:

1. The application allows you to login with a username and a password 
2. The application displays a list of employees in a café. Details about each
employee can be viewed by double clicking on the employee name
3. Employees can be added to the list of employees by adding their first
and last names, start date (format YYYY-MM-DD) and email
4. Employee data can be changed by clicking on Edit
5. Employee data can be deleted by clicking on Delete
6. Users can log out from the application

## What needs to be done:
● Prepare test cases for this application using any tool of your
choice.
● Please use any language or framework (preferably Selenium) of your
preference to automate the selection of the use cases.
● Provide such documentation that a layman could be able to checkout and
execute your project.
● Explain clearly how to launch the automated tests. Add the documentation to
the same repository as the other files. Preferably upload everything to
Bitbucket or Github or any code repository of your choice. If that is not
possible, please send all files in a zip-file.

## Hints:
● Make a choice as to what tests you want to automate and which not. (Since you
have limited time we advice you to do only a few and do them well instead of
large numbers.)
● Choose an implementation for the assignment (with or without a framework).
● Think about how you structure your code from a maintainability and reusability
perspective.
● Provide clear documentation on how to get the project running and explain your
thought process when working on it with respect to your test approach,
framework choice, tests covered, test results, like the decisions you made and
why you choose that solution?

# Solution

Cucumber is a testing framework, used to write acceptance testing for the web application. Thus follows basic concept of writing every test cases in human language. Here the term human language defines the plain form of structured languages called Gherkin.
Gherkin used for writing cucumber feature files. It has been translated over 70 languages. If you ask what’s the role of Cucumber here, Then we can finish it with one phrase that cucumber is an open source tool that acts as a strong bridge between the test result and human languages. It mainly follows Behavior Driven Development (BDD) methodology. Cucumber support many languages like Ruby, Python, Java, etc.
Identically, Cucumber is integrated and supported by many frameworks like Watir, ruby on rails, Selenium, Capybara and so on. In this tutorial, we had focused on integrating cucumber with watir.

## Quick Start 

● Install Ruby last version. https://www.ruby-lang.org/es/documentation/installation/

● Make sure you have installed ruby on your system. ruby -v

● Download chrome driver here https://chromedriver.storage.googleapis.com/index.html?path=2.38/

● Now, Extract the zip file and put this on system path.

● Then run bundle install to install gems for our testing.

● Install requiered gems with Command: bundle install

## Project Structure 

● feature/data: JSON files where is located all test data about URL and users.

● feature/locators: JSON files where is located all HTML locators used to locate elements on web page.

● feature/page_objects: .rb files where is implemented the automatizations of the system pages using POM pattern

● feature/reports: JSON and HTML files. Contains result reports after test executions.

● feature/screenshots: JPEG files with screenshots of the last test case system screenshot. Is created when start the first execution because is seted in .gitignore file.

● feature/step_definitions: In cucumber, each step in the scenario would look for matching step definition. A step definition is a Ruby method with an expression that links to one or more gherkins steps.

● feature/support: Contains env.rb file with the driver initialization and other importants funtionalities.

● feature/test: Contains features file with test cases scenarios whriten in Gerkin language.

● feature/tools: A Tool class is used to simplify the functionalities of watir webdriver.

● .gitignore: Contains the files that we won´t upload to git repository

● cucumber.yml: It has the cucumber profile to be execute.

● docker-compose: It has the docker configuration to download docker images and run the project on it.

● Gemfile: It has the gems used on this project and can be install with bundle.
## Gherkin Keywords

### Feature:
Furthermore, the Gherkin documents will start with Keyword called “Feature”. In this section, we would describe the functionality of software feature. The description in Feature has no special meaning, it will hold only the important aspects of software features. And, it will not have any impact on run-time and the descriptions can be ignored.

### Background:
In general, “Background” keyword is used to repeat the same set of steps before starting all Scenario in a feature and after the Before hooks.
In feature file, we write the keyword Background before the first Scenario. Here the feature file contains only one set of Background steps.

### Scenario:
A scenario is one of the core of Gherkin structures. Every scenario starts with the keyword Scenario followed by an optional scenario title. It describes the specific test of the software function. It contains one or more steps. Cucumber executes each step but once at a time.

### Given:
Given step describes the initial state of the system. When cucumber executes the step of Given, it will put the system in a known state before user interacting the system.

### When:
When is used to describe an action or event.

### Then:
Then is used to describe the expected result or outcome. Then step is use assertion to compare the actual outcome and expected outcome.

### And & But:
Can be used when we use multiple Given, When and Then statements.

### Feature file
In cucumber, all test cases are written in feature files. Feature file will have the extension of .feature. The first line of the feature file starts with keyword Feature. Plus, Every feature file contains single feature. Now, the feature contains one or more Scenarios and each scenario contains a list of steps. Likewise, Feature keyword used to describe the functionality of test.

## How execute test cases

● Open a Terminal instance and go to a directory where you want put the code.

● Clone the project 

● Run the Test Suite with Chrome with this command line: cucumber -p testsuite_ch

● Run the Test Suite with Firefox with this command line: cucumber -p testsuite_ff

● Run the Test Suite with Docker Image of Firefox with this command line: cucumber -p testsuite_ff_remote

● Run the Test Suite with Docker Image of Chrome with this command line: cucumber -p testsuite_ch_remote

## How to see the results

When the execution finishes, you can see the results with a HTML report autogenerated on the reports directory and for more details you can see the screenshots too.

