component extends="mxunit.framework.TestCase" output="false" {
  variables.user = {};
  function beforeTests() {
    user = createTestUser();
  }
  function testGetFullName() {
    assertEquals("Test User", user.getFullName(), "Full Name does not match expected.");
  }
  function testGetGreeting() {
    assertEquals("Hello, Test User", user.getGreeting(), "Greetings does not match expected.");
 
  }
 function testUserAge() {
    user.setAge(5);
    assertTrue(isNumeric(user.getAge()), "Age is not a number.");
    assertEquals(5, user.getAge(), "Age does not match expected.");
 
  }

  //helper functions
  private any function createTestUser() {
    return new Model.user.User("Test", "User");
  }
}