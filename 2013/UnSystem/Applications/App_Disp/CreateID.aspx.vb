Imports DB_Access
Public Class CreateID
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    ''' <summary>
    ''' ログアウトクリック
    ''' </summary>
    ''' <remarks>ログイン画面に遷移する。</remarks>
    Protected Sub likLogout_Click(ByVal sender As Object, ByVal e As EventArgs) Handles likLogout.Click

        ' ログイン画面へ遷移
        If Not Session(Common.STR_LOGIN) Is Nothing Then
            Session.Remove(Common.STR_LOGIN)
        End If

        Response.Redirect("Login.aspx", False)

    End Sub

End Class