Imports DB_Access
Public Class PersonalInput
    Inherits System.Web.UI.Page
    Dim clsCommon As New Common

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

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
        clsCommon.GetWork(lstWork)
        ' 就業期間取得
        clsCommon.GetFromToDate(lstFromYear, lstFromMonth, lstFromDay, lstToYear, lstToMonth, lstToDay)

        id_firstname.Attributes.Add("readonly", "true")
        id_LastName.Attributes.Add("readonly", "true")
        id_birthday.Attributes.Add("readonly", "true")
        id_PJName.Attributes.Add("readonly", "true")
        id_Cost.Attributes.Add("readonly", "true")
        lstFromYear.Enabled = False
        lstWork.Enabled = False
        lstFromYear.Enabled = False
        lstFromMonth.Enabled = False
        lstFromDay.Enabled = False
        lstToYear.Enabled = False
        lstToMonth.Enabled = False
        lstToDay.Enabled = False
        lstSex.Enabled = False
        id_Register.Visible = False

        ' 閾値
        'clsCommon.GetThreshold(lstThreshold)
        ' 性別
        clsCommon.GetSex(lstSex)

    End Sub
End Class