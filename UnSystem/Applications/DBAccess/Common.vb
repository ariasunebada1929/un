Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.ListItemCollection

Public Class Common

    ' セッション変数----------------------------------------------------
    Public Const STR_LOGIN As String = "Session.LOGIN"

    ' ログイン情報
    Public Structure LoginInfo

        Public LoginUserID As String
        Public LoginUserName As String
        Public OpeLevel As Define.OpeLevel

    End Structure

    ''' <summary>
    ''' 共通メッセージ取得関数
    ''' </summary>
    ''' <param name="dMsg">メッセージ定義</param>
    ''' <returns>取得文字</returns>
    ''' <remarks>指定したDefineでメッセージを取得</remarks>
    Public Function GetMessage(ByVal dMsg As Define.Message) As String
        Return CStr(My.Resources.Message.ResourceManager.GetObject(dMsg.ToString))
    End Function

    ''' <summary>
    ''' 期間作成関数(開始年)
    ''' </summary>
    ''' <param name="lstFromYear">期間年</param>
    ''' <param name="lstFromMonth">期間月</param>
    ''' <param name="lstFromDay">期間日</param>
    ''' <param name="lstToYear">期間年</param>
    ''' <param name="lstToMonth">期間月</param>
    ''' <param name="lstToDay">期間日</param>
    ''' <remarks>指定したDefineでメッセージを取得</remarks>
    Public Sub GetFromToDate(ByRef lstFromYear As DropDownList, ByRef lstFromMonth As DropDownList, ByRef lstFromDay As DropDownList, _
                            ByRef lstToYear As DropDownList, ByRef lstToMonth As DropDownList, ByRef lstToDay As DropDownList)


        GetDate(lstFromYear, lstFromMonth, lstFromDay)
        GetDate(lstToYear, lstToMonth, lstToDay)

    End Sub

    ''' <summary>
    ''' 期間作成関数
    ''' </summary>
    ''' <param name="lstYear">期間年</param>
    ''' <param name="lstMonth">期間月</param>
    ''' <param name="lstDay">期間日</param>
    ''' <remarks>指定したDefineでメッセージを取得</remarks>
    Public Sub GetDate(ByRef lstYear As DropDownList, ByRef lstMonth As DropDownList, ByRef lstDay As DropDownList)

        ' 就業期間(※現在の日付より未来1年間、過去4年間の日付を取得する。)
        Dim lstitem As New ListItem
        Dim iyear As Int32 = 0
        Dim imonth As Int32 = 0
        Dim iday As Int32 = 0

        If Int32.TryParse(Now.ToString("yyyy"), iyear) AndAlso _
            Int32.TryParse(Now.ToString("MM"), imonth) AndAlso _
            Int32.TryParse(Now.ToString("dd"), iday) Then

            ' 未来の年を加算する。
            iyear += 1

            ' 年のリストを作成
            For i As Int32 = 0 To 4
                lstitem = New ListItem
                lstitem.Value = CStr(iyear)
                lstitem.Text = iyear.ToString
                lstYear.Items.Add(lstitem)
                iyear -= 1
            Next

            lstitem = New ListItem
            lstitem.Value = CStr(9999)
            lstitem.Text = "----"
            lstYear.Items.Add(lstitem)

            ' 就業期間には現在の年を選択状態にする
            lstYear.SelectedValue = Now.ToString("yyyy")

            ' 月のリストを作成
            For imonth = 1 To 12
                lstitem = New ListItem
                lstitem.Value = CStr(imonth)
                lstitem.Text = imonth.ToString
                lstMonth.Items.Add(lstitem)
            Next

            ' 就業期間には現在の月を選択状態にする
            lstMonth.SelectedValue = Now.ToString("MM")

            ' 現在の月の最大日を取得
            Dim iMaxDay As Int32 = Date.DaysInMonth(CInt(Now.ToString("yyyy")), CInt(Now.ToString("MM")))

            ' 日のリストを作成
            For iday = 1 To iMaxDay
                lstDay.Items.Add(CStr(iday))
            Next

            ' 就業期間には現在の日を選択状態にする
            lstDay.SelectedValue = Now.ToString("dd")

        End If

    End Sub

End Class
