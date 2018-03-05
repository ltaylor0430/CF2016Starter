component {
  
  //helper functions
   public any function createTestUser() {
    return new Model.user.User("Test", "User");
  }
  public any function returnSingleUser() {
    return QueryNew("id,firstName, lastName","Integer, VarChar, VarChar",
    [{id:1,firstName:'John', lastName:'Doe'}]);
     // list 
  }
  public any function returnMultipleUsers() {
  
   return QueryNew("id,firstName, lastName","Integer, VarChar, VarChar",
    [ 
      {id:1,firstName:'John',  lastName:'Doe'},
      {id:2,firstName:'Jane',  lastName:'Doe'},
      {id:3,firstName:'Chris', lastName:'Doe'}
    ]);
  }
   public any function returnNoUser() {
    return QueryNew("id,firstName, lastName","Integer, VarChar, VarChar",
    []);
  }
}