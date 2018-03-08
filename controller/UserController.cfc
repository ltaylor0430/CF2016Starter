component output="false"  {
    this.userService =new Model.user.UserService();
  
 remote function getUserDetailsData(string id) 
   returntype="struct"
   returnFormat="JSON"
  {
   try {
      var userDetails = this.userService.getUserDetails(arguments.id);
      return userDetails;
   } catch (any err){
       err.isRemoteException = true;
       rethrow;

       //We need to override the default way CF handle errors.  Application.cfc will handle all errors for remote Excep
     /*  var responseError = {};
       responseError.message = err.message;
       responseError.status = 500;
       cfheader(name = "statusCode", value="500");
       cfheader(name = "statusText", value="#err.message#");
        rethrow;
        return responseError;*/
   }
    
  }
}