<%
if session("uid")<>"" then
	response.Redirect("u_index.asp")
elseif session("duid")<>"" then
	response.Redirect("d_index.asp")
elseif session("adminid")<>"" then
	response.Redirect("admin_index.asp")
else
	response.Redirect("login.asp")
end if
%>
