<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head><title>Scaffold Chooser</title></head>
  <body>Select the scaffold you hand to work on


  <table>
      <g:each in="${classes}" var="domainClass">
          <tr>
              <td> ${domainClass.clazz.name}</td>
               <td>
                   <g:link action="resolveController" params="[name: domainClass.clazz.name, actionName:'list']">list</g:link></td>
          </tr>
      </g:each>
  </table>
  </body>
</html>