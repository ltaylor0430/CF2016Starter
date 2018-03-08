component {
  
  public function onError(required any exception) {
           if (isJsonResponseNeeded()) {
             var remoteException = new model.exceptions.RemoteException();
             remoteException.returnErrorResponse(arguments.exception.message & ' details: ' & arguments.exception.detail);
            }
           

} 
   private function isJsonResponseNeeded() {
          return reFindNoCase("\.cfc$", CGI.script_name);
        }
}