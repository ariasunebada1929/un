Imports System.Web
Imports MySql.Data.MySqlClient
Imports DB_Access

Public Class Login
    Inherits System.Web.UI.Page

#Region " フォームロード "

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Me.IsPostBack Then
            ' セッションを削除
            Session.Remove(Common.STR_LOGIN)
        End If

    End Sub

#End Region

#Region " ログインボタン "

    Protected Sub btnlogin_Click(ByVal sender As Object, e As EventArgs) Handles btnlogin.Click

        Dim clsLoginDBAccess As New LoginDBAccess
        Dim clsCommon As New Common
        Dim DataReader_auth As MySqlDataReader = Nothing
        Dim Infologin As New Common.LoginInfo

        Try

            ' 認証チェック用データ取得
            DataReader_auth = clsLoginDBAccess.GetTBLAuthCheck(txtid.Text, txtpw.Text)

            If Not DataReader_auth.HasRows Then
                MsgBox(clsCommon.GetMessage(Define.Message.Login_InputErr))
                Exit Sub
            Else
                Infologin.LoginUserID = DataReader_auth("PersonalID").ToString
                Infologin.LoginUserName = DataReader_auth("FirstName").ToString & "　" & DataReader_auth("LastName").ToString
                Infologin.OpeLevel = CType(DataReader_auth("Level").ToString, Define.OpeLevel)
                Session(Common.STR_LOGIN) = Infologin
            End If

            If CInt(DataReader_auth.Item("Level")) = Define.OpeLevel.Personal Then
                ' 技術者入力画面へ遷移
                Response.Redirect("PersonalInput.aspx", False)
            Else
                ' 技術者一覧画面へ遷移
                Response.Redirect("Plist_search.aspx", False)
            End If

        Catch ex As Exception
            MsgBox(clsCommon.GetMessage(Define.Message.SystemErr))
        Finally
            ' クラス破棄
            clsLoginDBAccess.Dispose()
            If DataReader_auth IsNot Nothing Then
                DataReader_auth.Dispose()
            End If
        End Try

    End Sub

#End Region

End Class
