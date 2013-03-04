<html>
  <head>
    <meta name="layout" content="main" />
    <title>Login</title>         
  </head>
  <body>
    <div class="body">
     
      <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
      </g:if>
      <g:form action="authenticate" method="post" >
        <div class="dialog">
          <table>
            <tbody>            
              <tr class="prop">
                <td class="name">
                  <label for="login">Логин</label>     ..   <input type="text" id="login" name="login"/>
                </td>
              </tr> 
          
              <tr class="prop">
                <td class="name">
                  <label for="password">Пароль</label>.<input type="password" id="password" name="password"/>
                </td>
              </tr> 
            </tbody>
          </table>
        </div>
        <div class="buttons">
          <span class="button">
            <input class="save" type="submit" value="ВОЙТИ" />
          </span>
        </div>
      </g:form>
    </div>
  </body>
</html>