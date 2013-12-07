Imports DB_Access
Imports MySql.Data.MySqlClient

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
        ' 入力情報を取得
        Dim clsPersonalInput_DBAccess As New PersonalInput_DBAccess
        Dim DataReader_personal As MySqlDataReader = Nothing
        Dim PersonalID As String
        Dim Birthday1 As String
        Dim statusFrom1 As String
        Dim statusTo1 As String


        PersonalID = "12345"

        Try
            ' 性別
            clsCommon.GetSex(lstSex)
            ' 就業状況
            clsCommon.GetWork(lstWork)
            ' 就業期間取得
            clsCommon.GetFromToDate(lstFromYear, lstFromMonth, lstFromDay, lstToYear, lstToMonth, lstToDay)

            ' 認証チェック用データ取得
            DataReader_personal = clsPersonalInput_DBAccess.GetTBLPersonalDisp(PersonalID)
            DataReader_personal.Read()

            id_firstname.Text = DataReader_personal("firstname").ToString()
            id_LastName.Text = DataReader_personal("lastname").ToString()
            'Birthday1 = DataReader_personal("Birthday").ToString()
            id_birthday.Text = CStr(Date.Parse(Format(CInt(DataReader_personal("Birthday").ToString()), "0000/00/00")))
            lstSex.SelectedValue = DataReader_personal("Sex").ToString()
            lstWork.SelectedValue = DataReader_personal("Status").ToString()
            id_Cost.Text = DataReader_personal("Cost").ToString()

            statusFrom1 = DataReader_personal("StatusFrom").ToString()
            lstFromYear.SelectedValue = CStr(CDec(statusFrom1.Substring(0, 4)))
            lstFromMonth.SelectedValue = CStr(CDec(statusFrom1.Substring(4, 2)))
            lstFromDay.SelectedValue = CStr(CDec(statusFrom1.Substring(6, 2)))

            statusTo1 = DataReader_personal("StatusTo").ToString()
            lstToYear.SelectedValue = CStr(CDec(statusTo1.Substring(0, 4)))
            lstToMonth.SelectedValue = CStr(CDec(statusTo1.Substring(4, 2)))
            lstToDay.SelectedValue = CStr(CDec(statusTo1.Substring(6, 2)))


        Catch ex As Exception
            MsgBox(clsCommon.GetMessage(Define.Message.SystemErr))

        End Try
        clsPersonalInput_DBAccess.Dispose()
        If DataReader_personal IsNot Nothing Then
            DataReader_personal.Dispose()
        End If


        id_firstname.Attributes.Add("readonly", "true")
        id_LastName.Attributes.Add("readonly", "true")
        id_birthday.Attributes.Add("readonly", "true")
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