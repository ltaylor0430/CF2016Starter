component extends= "mxunit.framework.TestCase" output="false" {
 
  variables.userController =new controller.UserController();
 
  function getUserDetailTest() {
     userController.getUserDetailsData(1);
    

  }
 
}