component {
  //User Service
  variables.queryOptions = {
    datasource = "cfartgallery",
    result="myresult"
  };
  public any function getUsers() {
    var sql = "SELECT * FROM artgallery";
    return dbQuery(sql, [], queryOptions);

  }
  public any function dbQuery(string sql, any params, any options) {
   var queryService = new Query();
 // try {
    return queryService.execute(argumentsCollection);
  //}
  //  catch(err) {
   //   WriteLog('Unable to perform query. stacktrace:' & err.message  );
   // }
  }
}