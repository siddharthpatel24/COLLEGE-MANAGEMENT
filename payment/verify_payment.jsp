    <%
String payment = request.getParameter("payment");


    if(payment.equals("credit")){
        response.sendRedirect("credit.jsp");
    
    } else if (payment.equals("upi")) {
        response.sendRedirect("upi.jsp");
    }
%>