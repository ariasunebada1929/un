
' 項目値定義一覧(※固定値を管理)
Public Class Define

    ' 操作レベル
    Enum OpeLevel
        PawarUser = 1
        Negotiation = 2
        Personal = 3
        Administrator = 9
    End Enum

    ' 就業状況
    Enum WorkStatus
        Free = 0
        Work = 1
    End Enum

    ' 閾値
    Enum ThresholdStatus
        AndOver
        AndLess
        Equal
    End Enum

    ' 性別
    Enum Sex
        Man
        Woman
    End Enum

    ' メッセージ(※メッセージは全てここに定義)
    Enum Message
        SystemErr
        Login_InputErr
    End Enum

End Class
