<!--- Set up our test suite. --->
<cfscript>

  testSuite = new mxunit.framework.TestSuite().TestSuite();
 
  currentDirectory = getDirectoryFromPath( getCurrentTemplatePath() );
  files = DirectoryList(currentDirectory & "spec",true,"path","*.cfc");
  files.map(function(item) {
    var pathToFile = reMatch("spec([\s\S].*).cfc", item);
    pathToFile[1] = replace(pathToFile[1], ".cfc" ,"");
    var dotNotationPath = replace(pathToFile[1],"\", ".","all");
   //add Tests to suite
    testSuite.addAll(dotNotationPath);
  }); 
 /* testSuite.addAll( "spec.UserTest");
  testSuite.addAll("spec.UserServiceTest");*/

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

