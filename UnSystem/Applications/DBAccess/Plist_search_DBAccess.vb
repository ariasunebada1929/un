Imports MySql.Data.MySqlClient
Imports System.Configuration

' 技術者一覧用アクセスクラス
Public Class Plist_search_DBAccess

    Private Connection As MySqlConnection
    Private Command As MySqlCommand
    Private DataReader As MySqlDataReader

    Public Sub New()
        ' DBの接続情報を生成
        Connection = New MySqlConnection
        Command = New MySqlCommand
        DataReader = Nothing

        If ConfigurationManager.AppSettings("ConnectString") IsNot Nothing Then
            ' Web.configよりコネクションを取得
            Connection.ConnectionString = ConfigurationManager.AppSettings("ConnectString").ToString
        End If
    End Sub

    Public Sub Dispose()
        ' クラス情報破棄
        Connection.Close()
        Command.Dispose()
        Connection.Dispose()
        If DataReader IsNot Nothing Then
            DataReader.Dispose()
        End If
    End Sub

    ''' <summary>
    ''' 認証チェック用データ取得
    ''' </summary>
    ''' <param name="strid">ユーザーID</param>
    ''' <param name="strpass">ユーザーパス</param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Function GetTBLAuthCheck(ByVal strid As String, ByVal strpass As String) As MySqlDataReader

        ' オープン
        Connection.Open()

        Command = Connection.CreateCommand

        ' 認証用データ取得
        Command.CommandText = " SELECT * From un.trn_auth t1" & _
                              " INNER JOIN un.trn_personal t2 ON t1.PersonalID = t2.PersonalID " & _
                              " WHERE t1.PersonalID = " & strid & _
                              " AND " & " t1.PersonalPW = " & strpass

        ' コマンド送信
        DataReader = Command.ExecuteReader

        ' データ読み込み
        DataReader.Read()

        Return DataReader

    End Function

    ''' <summary>
    ''' 個人データ取得関数
    ''' </summary>
    ''' <param name="strFirstname">姓</param>
    ''' <param name="strLastname">名</param>
    ''' <param name="strbirhtDay">生年月日</param>
    ''' <param name="strThreshold">閾値</param>
    ''' <param name="strCompanyName">会社名</param>
    ''' <param name="strWorkFrom">就業期間(開始)</param>
    ''' <param name="strWorkTo">就業期間(終了)</param>
    ''' <param name="strOpeLevel">操作レベル</param>
    ''' <param name="strPersonalID">個人ID</param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Function GetTBLPersonal(ByVal strFirstname As String, ByVal strLastname As String, ByVal strbirhtDay As String, _
                                   ByVal strThreshold As String, ByVal strCompanyName As String, ByVal strWorkFrom As String, _
                                   ByVal strWorkTo As String, ByVal strOpeLevel As String, ByVal strPersonalID As String) As MySqlDataReader

        Dim bWhere As Boolean = False
        Dim WhereSQL As String = String.Empty

        ' 条件文を作成
        If Not Trim(strFirstname) = String.Empty Then
            ' 姓
            WhereSQL = " t1.Firstname LIKE '%" & strFirstname & "%' "
            bWhere = True
        End If

        If Not Trim(strLastname) = String.Empty Then
            WhereMake(bWhere, WhereSQL)

            ' 名
            WhereSQL = WhereSQL & " t1.Lastname LIKE '%" & strLastname & "%' "
            bWhere = True
        End If

        If Not Trim(strbirhtDay) = String.Empty Then
            WhereMake(bWhere, WhereSQL)

            ' 生年月日 + 閾値
            Select Case CType(strThreshold, Define.ThresholdStatus)
                Case Define.ThresholdStatus.AndOver
                    WhereSQL = WhereSQL & CStr(strbirhtDay) & " >= CAST(t1.Birhtday AS UNSIGNED) "
                Case Define.ThresholdStatus.AndLess
                    WhereSQL = WhereSQL & CStr(strbirhtDay) & " <= t1.Birhtday "
                Case Define.ThresholdStatus.Equal
                    WhereSQL = WhereSQL & CStr(strbirhtDay) & " = t1.Birhtday "
            End Select
            bWhere = True
        End If

        If Not strWorkFrom = String.Empty Then
            WhereMake(bWhere, WhereSQL)

            ' 就業期間(開始)
            WhereSQL = WhereSQL & CStr(strWorkFrom) & " >= CAST(t1.StatusFrom AS UNSIGNED) "
            bWhere = True
        End If

        If Not strWorkTo = String.Empty Then
            WhereMake(bWhere, WhereSQL)

            ' 就業期間(終了)
            WhereSQL = WhereSQL & CStr(strWorkTo) & " <= t1.StatusTo "
            bWhere = True
        End If

        If CType(strOpeLevel, Define.OpeLevel) = Define.OpeLevel.Negotiation Then
            WhereMake(bWhere, WhereSQL)

            ' 操作レベル(※営業者は同会社しか閲覧不可)
            WhereSQL = WhereSQL & "t1.CompanyID = (SELECT CompanyID FROM un.trn_personal t2 WHERE t2.PersonalD = " & strPersonalID & ") "
        End If


        ' オープン
        Connection.Open()

        Command = Connection.CreateCommand

        ' 検索データ取得
        Command.CommandText = " SELECT t1.lastname, t1.firstname, t1.cost, t1.statusform, t1.statusto From un.trn_personal t1" & _
                              WhereSQL

        ' コマンド送信
        DataReader = Command.ExecuteReader

        ' データ読み込み
        DataReader.Read()

        Return DataReader
    End Function

    Private Sub WhereMake(ByVal bStart As Boolean, ByRef strWhere As String)

        If bStart Then
            strwhere = " AND " & strwhere
        Else
            strWhere = " WHERE " & strWhere
        End If

    End Sub

End Class
