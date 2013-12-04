Imports System.Configuration
Imports MySql.Data.MySqlClient

' ログイン用アクセスクラス
Public Class LoginDBAccess

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

End Class
