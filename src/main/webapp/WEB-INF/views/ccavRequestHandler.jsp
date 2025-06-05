
<%
/*
		   This is the sample Checkout Page JSP script. It can be directly used for integration with CCAvenue if your application is developed in JSP. You need to simply change the variables to match your variables as well as insert routines (if any) for handling a successful or unsuccessful transaction.
		*/
%>

<%@ page
	import="java.io.*,java.util.*,com.ccavenue.security.*,com.ccavenue.security.AesCryptUtil"%>

<html>
<head>
<title>Sub-merchant checkout page</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
</head>
<body>
	<%-- <%System.out.println("Request Handler Username"+session.getAttribute("userName")); %> --%>
	<%
	//			String accessCode= "AVWS73EJ70BB32SWBB";		//Production Environment				Put in the Access Code in quotes provided by CCAVENUES.
	String accessCode = "ATUK06MB17BS50KUSB"; //Test Environment	LOCAL HOST			Put in the Access Code in quotes provided by CCAVENUES.
	//String accessCode = "AVTX04JF34CE18XTEC"; //ONLINE Test Environment			Put in the Access Code in quotes provided by CCAVENUES.

	//String workingKey = "E05BB9C2BE8CFFBE13E50C367547A32E";		//Production Environment		    Put in the 32 Bit Working Key provided by CCAVENUES.
	String workingKey = "30BB6115F0E0A2E4E20B5F73F183AC56"; //Test Environment	LOCAL HOST	    Put in the 32 Bit Working Key provided by CCAVENUES.
	//String workingKey = "7107B3857406689DBC2BF2B13A1418A1"; ONLINE Test Environment Put in the 32 Bit Working Key provided by CCAVENUES.

	Enumeration enumeration = request.getParameterNames();
	String ccaRequest = "", pname = "", pvalue = "";
	while (enumeration.hasMoreElements()) {
		pname = "" + enumeration.nextElement();
		pvalue = request.getParameter(pname);
		ccaRequest = ccaRequest + pname + "=" + pvalue + "&";
	}
	String encRequest = "";
	try {
		AesCryptUtil aesUtil = new AesCryptUtil(workingKey);
		encRequest = aesUtil.encrypt(ccaRequest);
	} catch (Exception e) {
		encRequest = null;
	}
	%>

	<!-- <form id="nonseamless" method="post" name="redirect" action="https://secure.ccavenue.com/transaction/transaction.do?command=initiateTransaction"/> -->
	<form id="nonseamless" method="post" name="redirect"
		action="https://test.ccavenue.com/transaction/transaction.do?command=initiateTransaction" />
		
	<input type="hidden" id="encRequest" name="encRequest"
		value="<%=encRequest%>">
	<input type="hidden" name="access_code" id="access_code"
		value="<%=accessCode%>">
		
	<script language='javascript'>
		document.redirect.submit();
	</script>
	</form>

</body>
</html>
