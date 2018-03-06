
 
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
      <p>Just going to run through some basic Cold Fusion stuff, conditional statements, for loops, objects, try-catch.</p>

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
               <div class="flex-item"><button class="btn btn-primary">View Details</button></div>
            </div>
           
          </cfoutput>
           </div>
           <div><h1>Serialize JSON Results</h1>
           <blockquote>
             <cfset test=serialize(dbUsersResults,"JSON",true)/>
             <cfoutput>#test#</cfoutput>
           </blockquote>
           </div>
      </div>
  </section>
 