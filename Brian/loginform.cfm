<cfif GetAuthUser() EQ "">
<cfinclude template="styles.cfm">
  <H2>Please Log In:</H2>
  <cfoutput>
  <form action="#CGI.script_name#?#CGI.query_string#" method="Post">
  <table>
    <tr>
      <td>Username:</td>
      <td><input type="text" name="j_username"></td>
    </tr>
    <tr>
      <td>Password:</td>
      <td><input type="password" name="j_password"></td>
    </tr>
  </table>
  <br>
  <input type="submit" value="Log In">
  </form>
</body>
</html>
  </cfoutput>
<cfelse>
  <cflocation url="index.cfm">
</cfif>
