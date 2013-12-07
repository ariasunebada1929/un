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

    ' ''' <summary>
    ' ''' グリッドデザイン
    ' ''' </summary>
    ' ''' <remarks>画面情報を初期化</remarks>
    'Private Sub GridInitDisp()

    '    Dim column As New DataGridColumnCollectio
    '    grdPesonal.Columns.Add(column)
    'End Sub

    ''' <summary>
    ''' テーブル項目作成
    ''' </summary>
    ''' <param name="dt">技術者情報テーブル</param>
    ''' <remarks>カラム情報を作成</remarks>
    Private Sub CreateTable(ByRef dt As DataTable)

        dt.Columns.Add("選択", Type.GetType("System.Int32"))
        dt.Columns.Add("会社名", Type.GetType("System.String"))
        dt.Columns.Add("氏名", Type.GetType("System.String"))
        dt.Columns.Add("単価", Type.GetType("System.Int32"))
        dt.Columns.Add("就業期間", Type.GetType("System.String"))
        dt.Columns.Add("変更", Type.GetType("System.String"))

        dt.TableName = "personalDB"

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

    ''' <summary>
    ''' テーブル項目作成
    ''' </summary>
    ''' <param name="Reader">技術者情報テーブル</param>
    ''' <remarks>カラム情報を作成</remarks>
    Private Sub CreateSchemaTable(ByRef Reader As MySqlDataReader, ByRef dt As DataTable)
        dt = Reader.GetSchemaTable()
    End Sub

#Region "ボタンイベント"

    ''' <summary>
    ''' 検索ボタンクリック
    ''' </summary>
    ''' <remarks>入力された条件で検索を行う</remarks>
    Protected Sub btnSearch_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnSearch.Click

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
            Dim row As DataRow = Nothing
            CreateTable(personaldt)

            If DataReader_personal.HasRows Then

                Do While DataReader_personal.Read()

                    row = personaldt.NewRow
                    row("選択") = 0
                    row("会社名") = String.Empty
                    row("氏名") = DataReader_personal("firstname").ToString() & DataReader_personal("lastname").ToString()
                    row("単価") = DataReader_personal("cost").ToString()
                    row("就業期間") = DataReader_personal("statusfrom").ToString() & DataReader_personal("statusto").ToString()
                    row("変更") = String.Empty

                    personaldt.Rows.Add(row)

                Loop

                grdPesonal.DataSource = personaldt
                grdPesonal.DataBind()
                grdPesonal.Visible = True

            Else
                MsgBox(clsCommon.GetMessage(Define.Message.SystemErr))
            End If

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
    Protected Sub btnHakkou_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnHakkou.Click

        ' ID発行画面へ遷移
        Response.Redirect("CreateID.aspx", False)

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

#End Region

End Class