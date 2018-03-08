
 
  <header>
    <ul class="links">
      <li >
        <a href="./">Home</a>
      </li>
      <li class="active">
        <a href="components.cfm">Components</a>
      </li>
      <li>
        <a href="about.cfm">About</a>
      </li>
    </ul>
    <div>
      
    </div>
  </header>
  <section class="container">
    <aside>  
      <cfoutput> #myGreeting#</cfoutput>
    </aside>
    <div class="test-item">
      <h1>Test Cold Fusion</h1>
      <p style="line-height:50px">Just going to run through some basic Cold Fusion stuff, conditional statements, for loops, objects, try-catch.</p>

      <h2>Conditional Statements with Script tags and form POST</h2>

      <form action="./components.cfm" method="POST">
        <div class="flex">
          <div class="item item-grow">
            <label for="age">Enter your age</label>
            <input type="text" name="age" autocomplete="none" />
          </div>
          <div class="item">
            <button type="submit">Update Age</button>
          </div>
        </div>

      </form>

      <cfif isDefined( "Form.age")>
        <div style="background-color:#e1e1e1;padding:10px;line-height:30px;">

          <cfoutput>
            You have entered:
            <ul>
              <li>
                <b>Your age:</b> #FORM.age#</li>

            </ul>

            <cfif Form.age GT 10>
              <div>Your old. Age is greater than 10</div>
              <cfelse>
                <div>Your young. Age is less than 10.</div>
            </cfif>
          </cfoutput>
          <cfdump var="#FORM#" label="Debugging with cfdump">

        </div>
      </cfif>
    </div>
 
 
    <div class="test-item">
      <div class="title">
        <h3>Database Response - Selecting from Artist Table</h3>
          <div class="flex-table">
            <div class="flex-row">
               <div class="flex-item table-header">First Name</div>
               <div class="flex-item table-header">Last Name</div>
               <div class="flex-item  table-header">Details</div>
            </div>
          <cfoutput query="dbUsersResults">
           
            <div class="flex-row">
               <div class="flex-item">#firstname#</div>
               <div class="flex-item">#lastName#</div>
               <div class="flex-item"><button class="btn btn-primary" onClick="onGetUserDetail('#ARTISTID#')">View Details</button></div>
            </div>
            <div data-artistDetail="#ARTISTID#-details" class="detail-output hidden">
            </div>
          </cfoutput>
           </div>
           <div><h1>Serialize JSON Results</h1>
           <blockquote style="font-size:10px;height:300px;overflow:hidden;">
             <cfset test=serialize(dbUsersResults,"JSON",true)/>
             <cfoutput>#test#</cfoutput>
           </blockquote>
           </div>
      </div>
  </section>
 
 <script type="text/javascript">
 function onGetUserDetail(artistId) {
   
   var output = "";
   var detailView = $('div').find('[data-artistDetail=' + artistId + '-details]');
   $.getJSON('./controller/UserController.cfc',{method:'getUserDetailsData',id:artistId}, function(data,status) {
     output = data.result;
     console.log(output);
     var headers = addDetailHeaders( output.COLUMNS);
     var rows =addDetailRows(output.DATA);
     var table = '<table style="font-size:80%;width:100%">' + headers + rows + '</table>';
     $(detailView).html('<div class="" style="word-wrap:break-word;width:100%;display:block;">' + table + '</div>');
   }).fail( function(exception) {
     var error = exception.responseJSON;
     console.error(error);
     alert('Unable to view details. ' + error.errors[0]);

   });
   
 }
 function addDetailHeaders(headerData) {
   var headerRow = '<tr>';
   _(headerData).map(function(header){
      headerRow+= '<th>' + header +'</th>';
   });
   headerRow +="</tr>";
   return headerRow;
   
 }
  function addDetailRows(rowData) {
   var row = '';
   _(rowData).map(function(data){
    row +='<tr>';
    data.map(function(dataRow) {
      row+= '<td>' + dataRow +'</td>';
    });
    row +="</tr>";
   });
     
    
   return row;
   
 }
 </script>