<!--- Set up our test suite. --->
<cfscript>

  testSuite = new mxunit.framework.TestSuite().TestSuite();
 //Todo: get all test in spec folder and provide mappings 
  testSuite.addAll( "spec.UserTest");
  testSuite.addAll("spec.UserServiceTest");

/*    Run the tests that have been added. This will include all the
    methods of the all the components that we added above  
*/  
  results = testSuite.run();
/*    Output the results. Pass in the web-root of the MXUnit
    folder so that the rendering can properly set up the CSS
    and JavaScript URLs.
*/
  WriteOutput(results.getHtmlResults("../mxunit/"));
</cfscript>

