Feature:CodeGrader functional testing
   
   This feature is tested as a function of the overall test, as the ultimate inheritance of the test. In order to test whether the overall function is passed. As a stakeholder, the test needs to be tested separately for students and teachers, as well as the integration test
  
  @stu_uplode
  Scenario Outline: Students upload task code
     Given Student write code stored in the local
     When Student chose "<homework>"
     And  Student click "uplode" button
     Then The uplode button in Student's view should changed as "uploded" ,and the code should be stored into file server,return uplode success 

  Examples: 
    |homework|
    |HW1|
    |Hw2|
    |Hw3|     

  @stu_test
  Scenario Outline: Students testing code
    Given Students have successfully submitted a written task code "<homework>"
    And  The teacher has successfully submitted the corresponding test code "<Spec>" for "<homework>"
    When Student Click to view the "<homework>" Report
    Then Generate "<homework>" test report

  Examples: 
  |homework|Spec    |
  |HW1     |HW1_Spec|
  |Hw2     |HW2_Spec|
  |Hw3     |HW3_Spec|     


  @stu_checkReport
  Scenario Outline: Student check report
    Given There has generated the test report for "<homework>"
    When  I Click the button of checking report about "<homework>"
    Then View the report of "<homework>"

  Examples:
  |homework|
  |HW1|
  |Hw2|
  |Hw3|     

  @tea_uplode
  Scenario Outline: Teacher submit test code
      Given Teacher written homework "<homework>" test code
     When  The teacher choose the test file "<Spec>"" for "<homework>" 
     And Teacher click Submit button
     Then return success uplpde, and code be store in file server 
  Examples: 
  |homework|Spec    |
  |HW1     |HW1_Spec|
  |Hw2     |HW2_Spec|
  |Hw3     |HW3_Spec|     
