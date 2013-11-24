function SearchButton() {
    document.getElementById('na_Search').style.display = 'block';
    return false;
}

function CloseButton() {
    document.getElementById('na_Search').style.display = 'none';
    return false;
}

/* 年月(開始)変更時のイベント */
function lstFrom_OnChange() {

    GetMaxDay(parseInt(document.getElementById('lstFromYear').value),
    parseInt(document.getElementById('lstFromMonth').value),
    document.getElementById('lstFromDay'));
    return false;

}

/* 年月(終了)変更時のイベント */
function lstTo_OnChange() {

    GetMaxDay(parseInt(document.getElementById('lstToYear').value),
    parseInt(document.getElementById('lstToMonth').value),
    document.getElementById('lstToDay'));
    return false;

}

/* 年月から最大日を取得する関数 */
function GetMaxDay(iyear, imonth, contrl) {

    imaxday = new Date(iyear, imonth, 0).getDate();

    var lstday;
    lstday = contrl;
    var len = lstday.length;
    var save = [];

    for (i = 0; i < len; i++) {
        lstday.remove(0);
    }

    for (i = 1; i < imaxday + 1; i++) {
        var opt = document.createElement("option");
        opt.value = i;
        opt.text = i;
        lstday.add(opt);
    }

}