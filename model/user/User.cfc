component {
  this.baseGreeting ="Hello, "; //public scope
  variables.baseGreeting2 ="Hello, "; // private scope
  variables.user = {}; // creates a structure
  
  public any function init(String firstName, String lastName) {
    writeLog("Running Init Function");
    // constructor 
    try {
    structInsert(user, "id","1");
    structInsert(user, "firstName", arguments.firstName);
    structInsert(user, "lastName",  arguments.lastName);
    structInsert(user, "age","2");
    
    } catch(any err) {
      //Key Exist handle Exception
      //
      writeLog(err.message);
      rethrow;
    }
    return this;
  }   
  /*
  public string function getFullName(String firstName, String lastName) {
    var fullName = arguments.firstName & " " & arguments.lastName;
    return fullname;
  }*/
    public string function getFullName() {
    var fullName = user.firstName & " " & user.lastName;
    return fullname;
  }
  public string function getGreeting() {
    var fullName = getFullName();  
    var greeting = this.baseGreeting & fullName;
    return greeting;
  }
  public any function getAge() {
    var age = Int(lsParseNumber(user.age));
    return age;


  }
  public void function setAge(any age) {
    user.age = arguments.age;
  }
}