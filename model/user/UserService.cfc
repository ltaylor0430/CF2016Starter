component {
  //User Service
  variables.queryOptions = {
    datasource = "cfartgallery"
  };
  public any function getUsers() {
    var sql = "SELECT * FROM ARTISTS";
    return dbQuery(sql, [], "getUsers");

  }
  public any function getUserDetails(string id) {
    var sql = "SELECT * FROM ARTISTS WHERE artistId = ?";  
    return dbQuery(sql,[{cfsqltype:"CF_SQL_VARCHAR",value:arguments.id}], "getUserDetails");
   
  }
  
  public any function dbQuery(string sql, any params, string name) {
   var queryService = new Query(parameters = arguments.params);
    queryService.setDatasource("cfartgallery");
    queryService.setName(arguments.name);
   
   try {
       return queryService.execute(sql=arguments.SQL);
     // return queryExecute(arguments.sql, arguments.params, queryOptions);
    }
    catch(any err) {
       WriteLog('Unable to perform query. stacktrace:' & err.message  );
    rethrow;
    }
  }
 
}