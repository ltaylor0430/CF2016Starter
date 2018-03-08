<cfcomponent
    output="false"
    hint="I define the unit-testing application settings.">
  
    <!---
        Get the tests directory - we'll be setting up mappings for
        directories relative to our testing directory.
    --->
    <cfset this.directory = getDirectoryFromPath( getCurrentTemplatePath() ) />

    <!---
        Get our MXUnit directory - we'll need this in order to run
        the test suties from our tests directory.
    --->
    <cfset this.mxunitDirectory = (this.directory) />
 
    <!---
        ***** MX UNIT FRAMEWORK *****
        Set up a mapping to the MXUnit framework; this is requied for
        the framework installation to run without a global mapping.
    --->
    <cfset this.mappings[ "/mxunit" ] = this.mxunitDirectory />
 
  

</cfcomponent>