<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page
	import="java.io.*,java.util.*,com.ccavenue.security.*,com.ccavenue.security.AesCryptUtil"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Response Handler</title>

<!-- AngularJS -->
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>

<script
	src="<%=request.getContextPath()%>/resources/admin/js/confAdmin.js"></script>

</head>
<body ng-app="kuberbhandari" ng-controller="ccAvResCtrl">
	
	<%-- <%System.out.println("Response Handler Username"+session.getAttribute("userName")); %>   --%>
	<%
	String workingKey = "30BB6115F0E0A2E4E20B5F73F183AC56"; //Test Environment	LOCAL HOST	32 Bit Alphanumeric Working Key should be entered here so that data can be decrypted.
	//String workingKey = "7107B3857406689DBC2BF2B13A1418A1"; //ONLINE Test Environment	32 Bit Alphanumeric Working Key should be entered here so that data can be decrypted.
	//String workingKey = "E05BB9C2BE8CFFBE13E50C367547A32E";		//Production Environment		32 Bit Alphanumeric Working Key should be entered here so that data can be decrypted.

	String encResp = request.getParameter("encResp");
	AesCryptUtil aesUtil = new AesCryptUtil(workingKey);
	String decResp = aesUtil.decrypt(encResp);
	StringTokenizer tokenizer = new StringTokenizer(decResp, "&");
	Hashtable hs = new Hashtable();
	String pair = null, pname = null, pvalue = null;
	while (tokenizer.hasMoreTokens()) {
		pair = (String) tokenizer.nextToken();
		if (pair != null) {
			StringTokenizer strTok = new StringTokenizer(pair, "=");
			pname = "";
			pvalue = "";
			if (strTok.hasMoreTokens()) {
		pname = (String) strTok.nextToken();
		if (strTok.hasMoreTokens())
			pvalue = (String) strTok.nextToken();
		hs.put(pname, pvalue);
			}
		}
	}

	//String MerchantId = (String) hs.get("Merchant_Id");
	String order_id = (String) hs.get("order_id");
	//String Amount = (String) hs.get("Amount");
	//String AuthDesc = (String) hs.get("AuthDesc");
	//String avnChecksum = (String) hs.get("Checksum");
	String bank_ref_number = (String) hs.get("bank_ref_no");
	//String bank_ref_number = (String)hs.get("nb_bid");
	String order_status = (String) hs.get("order_status");
	String failure_message = (String) hs.get("failure_message");
	String payment_mode = (String) hs.get("payment_mode");
	//String payment_mode = (String)hs.get("card_category");
	String card_name = (String) hs.get("card_name");
	//String bank_name = (String) hs.get("bank_name");
	String tracking_id = (String) hs.get("tracking_id");
	String status_code = (String) hs.get("status_code");
	String status_message = (String) hs.get("status_message");
	String currency = (String) hs.get("currency");
	//String Merchant_Param = (String)hs.get("Merchant_Param");
	%>
	<center>
		<font size="4" color="blue"><b>Response Page</b></font>
		<table border="1">
			<%
			Enumeration enumeration = hs.keys();
			while (enumeration.hasMoreElements()) {
				pname = "" + enumeration.nextElement();
				pvalue = "" + hs.get(pname);
			%>
			<tr>
				<td><%=pname%></td>
				<td><%=pvalue%></td>
			</tr>
			<%
			}
			%>
		</table>
	</center>

	<form>
		<input type="hidden" ng-model="orderid"
			ng-init="orderid = '<%=order_id%>'">
		<%-- <input type="hidden"
			ng-model="authdesc" ng-init="authdesc = '<%=AuthDesc%>'">  --%>
		<input type="hidden" ng-model="trackingid"
			ng-init="trackingid = <%=tracking_id%>"> <input type="hidden"
			ng-model="bankrefnumber"
			ng-init="bankrefnumber = '<%=bank_ref_number%>'"> <input
			type="hidden" ng-model="orderstatus"
			ng-init=" orderstatus = '<%=order_status%>'"> <input
			type="hidden" ng-model="failuremessage"
			ng-init="failuremessage = '<%=failure_message%>'"> <input
			type="hidden" ng-model="paymentmode"
			ng-init="paymentmode = '<%=payment_mode%>'"> <input
			type="hidden" ng-model="cardname"
			ng-init="cardname = '<%=card_name%>'">
		<%-- <input type="hidden"
			ng-model="bankname" ng-init="bankname = '<%=bank_name%>'">  --%>
		<input type="hidden" ng-model="statuscode"
			ng-init="statuscode = '<%=status_code%>'"> <input
			type="hidden" ng-model="statusmessage"
			ng-init="statusmessage = '<%=status_message%>'"> <input
			type="hidden" ng-model="currency"
			ng-init="currency = '<%=currency%>'"> <input type="submit"
			value="Submit" ng-init="ccavenueresponse()">
		<!-- <input type="submit" value="Submit" ng-click="ccavenueresponse()"> -->
	</form>

</body>
</html>