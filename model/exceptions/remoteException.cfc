 
<cfcomponent>
<cffunction  name="returnErrorResponse" access="public" returnType="void">
 	<cfargument name="message" required="true">
  <cfscript>
   var local = {};
       local.Response = {
       success:false,
       errors:[arguments.message]
       };
      var responseString = serializeJSON(local.Response);
     
      var responseInBinary = ToBinary(toBase64(responseString));
    
     
  </cfscript>
  <cfheader statusCode="500" >
  <cfcontent type="application/json" variable="#responseInBinary#"/>
</cffunction>
</cfcomponent>