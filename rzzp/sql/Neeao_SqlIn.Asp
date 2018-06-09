<%

'--------POST部份------------------
If Request.Form<>"" Then
	Fy_In = "exec|insert|select|delete|update|declare"
	Fy_Inf = split(Fy_In,"|")
	For Each Fy_Post In Request.Form
		For Fy_Xh=0 To Ubound(Fy_Inf)
			If Instr(LCase(Request.Form(Fy_Post)),Fy_Inf(Fy_Xh))<>0 Then
				Response.Write "<Script Language=JavaScript>alert('系统提示:\n\n请不要在参数中包含非法字符尝试注入！\n');</Script>"
				Response.End
			End If
		Next
	Next
End If
'----------------------------------

'--------GET部份-------------------
If Request.QueryString<>"" Then
	Fy_In = "'|;|and|(|)|exec|insert|select|delete|update|count|*|%|chr|mid|master|truncate|char|declare|or "
	Fy_Inf = split(Fy_In,"|")
	For Each Fy_Get In Request.QueryString
		For Fy_Xh=0 To Ubound(Fy_Inf)
			If Instr(LCase(Request.QueryString(Fy_Get)),Fy_Inf(Fy_Xh))<>0 Then
				Response.Write "<Script Language=JavaScript>alert('系统提示:\n\n请不要在参数中包含非法字符尝试注入！\n');</Script>"
				Response.End
			End If
		Next
	Next
End If

%>