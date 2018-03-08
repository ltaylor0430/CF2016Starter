 
<cfscript>
  
  currentDirectory = getDirectoryFromPath( getCurrentTemplatePath() );

  files = DirectoryList(currentDirectory & "spec",true,"path","*.cfc");
  writeDump(files);
  testsToRun = [];  
     
  files.map(function(item) {
    var pathToFile = reMatch("spec([\s\S].*)\.cfc", item);
    if (ISNull(pathToFile) ==false && ArrayLen(pathToFile) GTE 1) {
    pathToFile[1] = replace(pathToFile[1], ".cfc" ,"");
    var dotNotationPath = replace(pathToFile[1],"\", ".","all");
   //add Tests to suite
   writeOutput(dotNotationPath & "<br/>");
  
    ArrayAppend(testsToRun,dotNotationPath);
 
 
    }
  }); 
  writeDump(testsToRun);
  testSuite = new testbox.system.TestBox();
  results = testSuite.run(bundles= testsToRun,reporter="Simple");
 writeOutput(results);
</cfscript>
 