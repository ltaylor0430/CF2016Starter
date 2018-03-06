component {
  //User Service
  variables.queryOptions = {
    datasource = "cfartgallery",
    result="myresult"
  };
  public any function getUsers() {
    var sql = "SELECT * FROM ARTISTS";
    return dbQuery(sql, [], "getUsers");

  }
  public any function dbQuery(string sql, any params, string name) {
   var queryService = new Query();
    queryService.setDatasource("cfartgallery");
    queryService.setName(arguments.name);
   try {
       return queryService.execute(sql=arguments.SQL);
    }
    catch(any err) {
       WriteLog('Unable to perform query. stacktrace:' & err.message  );
    rethrow;
    }
  }
 
}