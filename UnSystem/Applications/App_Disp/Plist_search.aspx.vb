Imports System.Web
Imports MySql.Data.MySqlClient
Imports DB_Access

Public Class Plist_search
    Inherits System.Web.UI.Page

    ''' <summary>
    ''' ロード処理
    ''' </summary>
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim clsCommon As New Common

        Try

            If Not IsPostBack Then

                Dim loginInfo As Common.LoginInfo

                If Not Session(Common.STR_LOGIN) Is Nothing Then
                    ' Session にてログインユーザーの情報を取得する
                    loginInfo = CType(Session(Common.STR_LOGIN), Common.LoginInfo)
                    lblUserName.Text = loginInfo.LoginUserName
                    hdnOpeLevel.Value = CStr(loginInfo.OpeLevel)
                    hdnPersonalID.Value = CStr(loginInfo.LoginUserID)
                End If

                ' 初期表示処理
                InitDisplay(clsCommon)

            End If

        Catch ex As Exception
            MsgBox(clsCommon.GetMessage(Define.Message.SystemErr))
        End Try

    End Sub

    ''' <summary>
    ''' 画面項目初期化
    ''' </summary>
    ''' <param name="clsCommon">共通取得クラス</param>
    ''' <remarks>画面情報を初期化</remarks>
    Private Sub InitDisplay(ByVal clsCommon As Common)

        ' 就業状況
        clsCommon.GetWork(lstWork)
        ' 就業期間取得
        clsCommon.GetFromToDate(lstFromYear, lstFromMonth, lstFromDay, lstToYear, lstToMonth, lstToDay)
        ' 年齢
        clsCommon.GetAge(lstAge)
        ' 閾値
        clsCommon.GetThreshold(lstThreshold)
        ' 性別
        clsCommon.GetSex(lstSex)

        If CType(hdnOpeLevel.Value, Define.OpeLevel) = Define.OpeLevel.Negotiation Then
            ' 営業の場合は非表示
            txtcompany.Visible = False
        End If

    End Sub

    ''' <summary>
    ''' テーブル項目作成
    ''' </summary>
    ''' <param name="dt">技術者情報テーブル</param>
    ''' <remarks>カラム情報を作成</remarks>
    Private Sub CreateTable(ByRef dt As DataTable)

        dt.Columns.Add("LastName", Type.GetType("System.String"))
        dt.Columns.Add("FirstName", Type.GetType("System.String"))
        dt.Columns.Add("CompanyName", Type.GetType("System.String"))
        dt.Columns.Add("Cont", Type.GetType("System.Int32"))
        dt.Columns.Add("StatusFrom", Type.GetType("System.String"))
        dt.Columns.Add("StatusTo", Type.GetType("System.String"))

        '' 就業状況
        'clsCommon.GetWork(lstWork)
        '' 就業期間取得
        'clsCommon.GetFromToDate(lstFromYear, lstFromMonth, lstFromDay, lstToYear, lstToMonth, lstToDay)
        '' 年齢
        'clsCommon.GetAge(lstAge)
        '' 閾値
        'clsCommon.GetThreshold(lstThreshold)
        '' 性別
        'clsCommon.GetSex(lstSex)

    End Sub

#Region "ボタンイベント"

    ''' <summary>
    ''' 検索ボタンクリック
    ''' </summary>
    ''' <remarks>入力された条件で検索を行う</remarks>
    Protected Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click

        ' 入力情報を取得
        Dim clsPlist_search_DBAccess As New Plist_search_DBAccess
        Dim clsCommon As New Common
        Dim DataReader_personal As MySqlDataReader = Nothing
        Dim personaldt As New DataTable
        Dim strBirthDay As String = String.Empty
        Dim strWorkFrom As String = String.Empty
        Dim strWorkTo As String = String.Empty

        Try

            ' 年齢を算出
            If Not CInt(lstAge.SelectedValue) = 99 Then
                strBirthDay = clsCommon.GetBirthDay(CInt(lstAge.SelectedValue))
            Else
                strBirthDay = String.Empty
            End If

            ' 就業期間(開始)を設定
            If Not CInt(lstFromYear.SelectedValue) = 9999 Then
                strWorkFrom = lstFromYear.SelectedValue & String.Format("{0:00}", lstFromMonth.SelectedValue) & String.Format("{0:00}", lstFromDay.SelectedValue)
            Else
                strWorkFrom = String.Empty
            End If

            ' 就業期間(終了)を設定
            If Not CInt(lstToYear.SelectedValue) = 9999 Then
                strWorkTo = lstToYear.SelectedValue & String.Format("{0:00}", lstToMonth.SelectedValue) & String.Format("{0:00}", lstToDay.SelectedValue)
            Else
                strWorkTo = String.Empty
            End If

            ' 認証チェック用データ取得
            DataReader_personal = clsPlist_search_DBAccess.GetTBLPersonal(txtfirstname.Text, txtlastname.Text, strBirthDay, lstThreshold.SelectedValue,
                                                                          txtcompany.Text, strWorkFrom, strWorkTo, hdnOpeLevel.Value, hdnPersonalID.Value)

            CreateTable(personaldt)

            'row0 = {"池田", "a", "iii"}
            'GridView1.Rows.add(row0)

            'GridView1.SetEditRow()
            'GridView1.UpdateRow(1, True)

            GridView1.DataSource = personaldt
            GridView1.DataBind()

        Catch ex As Exception
            MsgBox(clsCommon.GetMessage(Define.Message.SystemErr))
        Finally
            ' クラス破棄
            clsPlist_search_DBAccess.Dispose()
            If DataReader_personal IsNot Nothing Then
                DataReader_personal.Dispose()
            End If
        End Try


    End Sub

    ''' <summary>
    ''' ID発行ボタンクリック
    ''' </summary>
    ''' <remarks>ID発行画面へ遷移する</remarks>
    Protected Sub btnHakkou_Click(sender As Object, e As EventArgs) Handles btnHakkou.Click

        ' ID発行画面へ遷移
        Response.Redirect("CreateID.aspx", False)

    End Sub

#End Region
    Protected Sub gridview1_rowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowCreated

        If e.Row.Cells.Count > 1 Then

            e.Row.Cells(0).Style.Add("width", "40px")
            e.Row.Cells(1).Style.Add("width", "100px")
            e.Row.Cells(2).Style.Add("width", "")
            e.Row.Cells(3).Style.Add("width", "")
            e.Row.Cells(4).Style.Add("width", "")
            e.Row.Cells(5).Style.Add("width", "")
            e.Row.Cells(6).Style.Add("width", "")

        End If

    End Sub

End Class