
<doctype !html />
<html lang="en">

<head>
  <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link href="https://fonts.googleapis.com/css?family=Mukta+Malar" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="main.css">
  <cfheader name="expires" value="#now()#">
    <cfheader name="pragma" value="no-cache">
      <cfheader name="cache-control" value="no-cache, no-store, must-revalidate">

</head>

<body>
<!-- cold fusion -->
<!-- Setup Code -->
<cfparam  name="myGreeting" default=""/>
<cftry>
 <!--- CreateObject("components.user.User") --->
    <cfset User = new Model.user.user(firstName="Lawrence", lastName="Taylor")/>
    <cfset UserService = new Model.user.UserService() />
    <cfset myGreeting = User.getGreeting() />
    <cfset dbUsers = UserService.getUsers() />
    <cfset dbUsersResults = dbUsers.getResult() />
    
     <cfcatch >
      <!--- handles errors --->
      <cfoutput>
      <div class="growl-notification">Exception Occured:  #cfcatch.type#  - #cfcatch.message#.  Stacktrace: #cfcatch.detail#</div>
      </cfoutput>
 
    </cfcatch>

</cftry>
<cfinclude template="components.template.cfm"/>
</body>
</html>