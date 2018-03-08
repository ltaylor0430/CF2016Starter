component extends= "mxunit.framework.TestCase" output="false" {
  variables.userService = {};
  variables.userDbMock = new Mocks.UserDbMock();
  function setup() {
    userService = new Model.user.UserService();
  }
  function beforeTests() {
 
  }
 function testGettingUserWithOneResult() {
   injectMethod(userService,userDbMock,"returnSingleUser","dbQuery"); //spies
   var users = userService.getUsers();
   writeDump(users);
   assertTrue(users.RecordCount == 1, users.RecordCount & " not equal expected count of 1");
 }
 function testGettingUserWithNoResult() {
   injectMethod(userService,userDbMock,"returnNoUser","dbQuery"); //spies
   var users = userService.getUsers();
   writeDump(users);
   assertTrue(users.RecordCount == 0, users.RecordCount & " not equal expected count of 0");
 }
 function testGettingUserWithMultipleResult() {
   injectMethod(userService,userDbMock,"returnMultipleUsers","dbQuery"); //spies
   var users = userService.getUsers();
   writeDump(users);
   assertTrue(users.RecordCount == 3, users.RecordCount & " not equal expected count of 3");
 }

 function testGettingUserDetails() {
     injectMethod(userService,userDbMock,"returnSingleUser","dbQuery"); //spies
   var userDetails = userService.getUserDetails("1");
   writeDump(userDetails);
   assertTrue(userDetails.RecordCount == 1,
    userDetails.RecordCount & " not equal expected count of 1." & Serialize(userDetails,"JSON",true));
   var indexOfFirstName = listFindNoCase(userDetails.ColumnList, "FIRSTNAME");
  if (indexOfFirstName EQ 0) {
    fail("Cannot find index to firstname in results");
  } else {
     var value = userDetails["FIRSTNAME"][1];
    assertEquals("John", value, Serialize(userDetails,"JSON",true));
  
  }
 }
}  