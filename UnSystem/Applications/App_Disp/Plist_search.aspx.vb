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

    End Sub

#Region "ボタンイベント"

    ''' <summary>
    ''' 検索ボタンクリック
    ''' </summary>
    ''' <remarks>入力された条件で検索を行う</remarks>
    Protected Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click

        ' 入力情報を取得

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

End Class