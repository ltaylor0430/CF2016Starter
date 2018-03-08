
<cfscript>

  testSuite = new mxunit.framework.TestSuite().TestSuite();
 
  currentDirectory = getDirectoryFromPath( getCurrentTemplatePath() );
//currentDirectory = getDirectoryFromPath( './tests/server/' );

  files = DirectoryList(currentDirectory & "spec",true,"path","*.cfc");
  writeDump(files);
  
     
  files.map(function(item) {
    var pathToFile = reMatch("spec([\s\S].*)\.cfc", item);
    if (ISNull(pathToFile) ==false && ArrayLen(pathToFile) GTE 1) {
    pathToFile[1] = replace(pathToFile[1], ".cfc" ,"");
    var dotNotationPath = replace(pathToFile[1],"\", ".","all");
   //add Tests to suite
   writeOutput(dotNotationPath & "<br/>");
  
    testSuite.addAll(dotNotationPath);
 
 
    }
  }); 
 
/*  Run the tests that have been added. This will include all the
    methods of the all the components that we added above  
*/  
  results = testSuite.run();
/*    Output the results. Pass in the web-root of the MXUnit
    folder so that the rendering can properly set up the CSS
    and JavaScript URLs.
*/
  WriteOutput(results.getHtmlResults("../mxunit/"));
</cfscript>

