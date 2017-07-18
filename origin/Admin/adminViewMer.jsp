<%@ page contentType="text/html; charset=gb2312" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>

<html>
<head>
<title><bean:message key="admin.pageTitle"/></title>
<link href="../CSS/stylesheet.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../JS/jsonrpc.js"></script>
<style type="text/css">
	<!--
	body {
		background-color: lightgrey;
	}
	-->
</style>
</head>
<body>

<html:form  action="/manageMerAction.do?method=updateMer" enctype="multipart/form-data">
  <table width="600" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr height="40">
        <td colspan="2" class="itemTitle" align="center">
        	<bean:message key="mer.info.text"/>
        </td>
      </tr>
      <tr height="24">
        <td width="160" align="right"><bean:message key="mer.category"/>��</td>
        <td><html:text property="category" value="${mer.category.cateName}" styleClass="textBox" readonly="true"/></td>
     </tr>
      <tr height="24">
        <td valign="top"  align="right"><bean:message key="mer.name"/>��</td>
        <td><html:text property="merName" value="${mer.merName }" size="41" styleClass="textBox" readonly="true"/></td>
     </tr>
      <tr height="24">
        <td width="160" align="right"><bean:message key="mer.model"/>��</td>
        <td><html:text property="merModel" value="${mer.merModel }" size="41" styleClass="textBox" readonly="true"/></td>
     </tr>
      <tr height="24">
        <td valign="top"  align="right"><bean:message key="mer.picture"/>��</td>
        <td> <img id="picture" src="images/default.jpg" height="80" width="80" border="1"/></td>
     </tr>
      <tr height="24">
        <td width="160" align="right"><bean:message key="mer.price"/>��</td>
        <td><html:text property="price" value="${mer.price }" size="41" styleClass="textBox" readonly="true"/></td>
     </tr>
      <tr height="24">
        <td valign="top"  align="right"><bean:message key="mer.special"/>��</td>
        <td>
			<input type="radio" name="special" readonly="true" checked>��</input>
			<input type="radio" name="special" readonly="true">��</input>
		</td>
     </tr>
      <tr height="24">
        <td width="160" align="right"><bean:message key="mer.sprice"/>��</td>
        <td><html:text property="sprice" value="${mer.sprice }" size="41" styleClass="textBox" readonly="true"/></td>
     </tr>
      <tr height="24">
        <td valign="top"  align="right"><bean:message key="mer.desc"/>��</td>
        <td><html:textarea property="merDesc" value="${mer.merDesc }" cols="40" rows="10" styleClass="textBox" readonly="true"/></td>
     </tr>
      <tr height="24">
        <td width="160" align="right"><bean:message key="mer.manufacturer"/>��</td>
        <td><html:text property="manufacturer" value="${mer.manufacturer}" size="41" styleClass="textBox" readonly="true"/></td>
     </tr>
      <tr height="24">
        <td valign="top"  align="right"><bean:message key="mer.leaveFactoryDate"/>��</td>
        <td><html:text property="leaveFactoryDate" value="${mer.leaveFactoryDate }" size="41" readonly="true" styleClass="textBox"/></td>
     </tr>	 	 	 	 
      <tr height="24">
        <td colspan="2" align="center">&nbsp;
			<html:link page="/manageMerAction.do?method=browseMers">
				<bean:message key="return.text"/>
			</html:link>
		</td>
     </tr>
    </table>
</html:form>
</body>
</html>