Imports DB_Access

Public Class Plist_search
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim clsCommon As New Common

        Try

            If Not IsPostBack Then

                Dim loginInfo As Common.LoginInfo

                If Not Session(Common.STR_LOGIN) Is Nothing Then
                    ' Session にてログインユーザーの情報を取得する
                    loginInfo = CType(Session(Common.STR_LOGIN), Common.LoginInfo)
                    lblUserName.Text = loginInfo.LoginUserName
                End If

                ' 初期表示処理
                InitDisplay(clsCommon)

            End If

        Catch ex As Exception

            MsgBox(clsCommon.GetMessage(Define.Message.SystemErr))
        End Try

    End Sub

    Private Sub InitDisplay(ByVal clsCommon As Common)

        ' 就業状況
        Dim lstworkitem As New ListItem
        lstworkitem.Value = CStr(Define.WorkStatus.Free)
        lstworkitem.Text = " 空き "

        lstWork.Items.Add(lstworkitem)

        lstworkitem = New ListItem
        lstworkitem.Value = CStr(Define.WorkStatus.Work)
        lstworkitem.Text = " 就業中 "

        lstWork.Items.Add(lstworkitem)

        ' 就業期間取得
        clsCommon.GetFromToDate(lstFromYear, lstFromMonth, lstFromDay, lstToYear, lstToMonth, lstToDay)

        ' 年齢
        'lstworkitem.Value =

    End Sub

End Class