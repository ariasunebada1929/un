Imports MySql.Data.MySqlClient
Imports System.Configuration

Public Class PersonalInput_DBAccess
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

    Public Function GetTBLPersonalDisp(ByRef PersonalID As String) As MySqlDataReader
        ' オープン
        Connection.Open()
        Command = Connection.CreateCommand

        ' 検索データ取得
        Command.CommandText = " SELECT t1.lastname, t1.firstname, t1.Birthday, t1.Sex, t1.cost, t1.status, t1.statusfrom, t1.statusto From un.trn_personal t1" &
                                " where t1.PersonalID=" & PersonalID
        ' コマンド送信
        DataReader = Command.ExecuteReader


        Return DataReader

    End Function


End Class
