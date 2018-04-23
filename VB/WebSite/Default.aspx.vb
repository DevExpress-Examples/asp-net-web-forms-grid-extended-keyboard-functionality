Imports Microsoft.VisualBasic
Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Protected Sub AccessDataSource1_Modifying(ByVal sender As Object, ByVal e As SqlDataSourceCommandEventArgs)
		Throw New NotImplementedException("Data modification is not allowed in the online example")
	End Sub
End Class
