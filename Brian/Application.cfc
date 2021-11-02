<html>
<head>
  <link href="style.css" rel="stylesheet" type="text.css">
</head>
<cfcomponent>
  <cfset This.name = "Orders">
  <cfset This.Sessionmanagement="True">
  <cfset This.loginstorage="session">
  <cfset This.login = "admin">
  <cfset This.pass  = "admin">
  
  <cffunction name="OnRequestStart">
    <cfargument name = "request" required="true"/>
    <cfif IsDefined("Form.logout")>
      <cflogout>
    </cfif>

    <cflogin>
    <cfif NOT IsDefined("cflogin")>
      <cfinclude template="loginform.cfm">
      <cfabort>
    <cfelse>
      <cfif cflogin.name IS "" OR cflogin.password IS "">
        <cfoutput>
          <h2>Both the User Name and Password fields must be filled.</h2>
        </cfoutput>
        <cfinclude template="loginform.cfm">
        <cfabort>
      <cfelse>
        <cfif #cflogin.name# EQ #This.login#
          AND #cflogin.password# EQ #This.pass#>
          <cfloginuser name="#cflogin.name#"
              Password = "#cflogin.password#" roles="Sales">
        <cfelse>
          <cfoutput>
          <H2>Your login information is not valid.<br>
              Please try again
          </H2>
          </cfoutput>
          <cfinclude template="loginform.cfm">
          <cfabort>
        </cfif>
      </cfif>
    </cfif>
    </cflogin>

    <cfif GetAuthUser() NEQ "">
      <cfoutput>
	<head>
          <title>Brian's ColdFusion Page</title>
      </cfoutput>
      <cfinclude template="styles.cfm">
      <cfoutput>
	</head>
	<body>
        <form action="index.cfm" method="Post">
          <input type="submit" Name="Logout" value="Logout">
        </form>
      </cfoutput>
    </cfif>

  </cffunction>
</cfcomponent>
</html>
