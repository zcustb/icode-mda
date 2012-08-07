

<%@ page import="gov.spawar.icode.Country" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'country.label', default: 'Country')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${countryInstance}">
            <div class="errors">
                <g:renderErrors bean="${countryInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${countryInstance?.id}" />
                <g:hiddenField name="version" value="${countryInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="country.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: countryInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${countryInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="countryCode"><g:message code="country.countryCode.label" default="Country Code" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: countryInstance, field: 'countryCode', 'errors')}">
                                    <g:textField name="countryCode" value="${countryInstance?.countryCode}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="callSignPrefixes"><g:message code="country.callSignPrefixes.label" default="Call Sign Prefixes" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: countryInstance, field: 'callSignPrefixes', 'errors')}">
                                    
<ul>
<g:each in="${countryInstance?.callSignPrefixes?}" var="c">
    <li><g:link controller="callSignPrefix" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="callSignPrefix" action="create" params="['country.id': countryInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'callSignPrefix.label', default: 'CallSignPrefix')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="maritimeIdDigits"><g:message code="country.maritimeIdDigits.label" default="Maritime Id Digits" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: countryInstance, field: 'maritimeIdDigits', 'errors')}">
                                    
<ul>
<g:each in="${countryInstance?.maritimeIdDigits?}" var="m">
    <li><g:link controller="maritimeIdDigit" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="maritimeIdDigit" action="create" params="['country.id': countryInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'maritimeIdDigit.label', default: 'MaritimeIdDigit')])}</g:link>

                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>