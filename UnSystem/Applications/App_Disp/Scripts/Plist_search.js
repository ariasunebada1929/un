function SearchInputButton() {
    document.getElementById('na_Search').style.display = 'block';
    return false;
}

function CloseButton() {
    document.getElementById('na_Search').style.display = 'none';
    return false;
}

/* 検索ボタン処理 */
function SearchButton() {

    var datefrom;
    var dateto;

    datefrom = document.getElementById('lstFromYear').value;
    datefrom += document.getElementById('lstFromMonth').value;
    datefrom += document.getElementById('lstFromDay').value;

    dateto = document.getElementById('lstToYear').value;
    dateto += document.getElementById('lstToMonth').value;
    dateto += document.getElementById('lstToDay').value;

    if (parseInt(dateto) > parseInt(datefrom)) {
        alert("就業期間の日付が逆転しています");
        document.getElementById('lstFromYear').focus();
        return false;
    }

    return true;
}

/* 年月(開始)変更時のイベント */
function lstFrom_OnChange() {

    var lstyear;
    lstyear = document.getElementById('lstFromYear');
    var lstmonth;
    lstmonth = document.getElementById('lstFromMonth');
    var lstday;
    lstday = document.getElementById('lstFromDay');

    GetMaxDay(lstyear, lstmonth, lstday)

    return false;

}

/* 年月(終了)変更時のイベント */
function lstTo_OnChange() {

    var lstyear;
    lstyear = document.getElementById('lstToYear');
    var lstmonth;
    lstmonth = document.getElementById('lstToMonth');
    var lstday;
    lstday = document.getElementById('lstToDay');

    GetMaxDay(lstyear, lstmonth, lstday)

    return false;

}

/* 年月から最大日を取得する関数 */
function GetMaxDay(lstyear, lstmonth, lstday) {

    var len;

    if (lstyear.value != 9999 && lstmonth.length == 1) {

        len = lstmonth.length;

        for (i = 0; i < len; i++) {
            lstmonth.remove(0);
        }

        for (i = 1; i < 12 + 1; i++) {
            var opt = document.createElement("option");
            opt.value = i;
            opt.text = i;
            lstmonth.add(opt);
        }

    }

    if (lstyear.value == 9999) {

        len = lstday.length;

        for (i = 0; i < len; i++) {
            lstday.remove(0);
        }

        var opt = document.createElement("option");
        opt.value = 99;
        opt.text = "--";
        lstday.add(opt);

        len = lstmonth.length;

        for (i = 0; i < len; i++) {
            lstmonth.remove(0);
        }

        var opt = document.createElement("option");
        opt.value = 99;
        opt.text = "--";
        lstmonth.add(opt);

    } else {

        imaxday = new Date(lstyear.value, lstmonth.value, 0).getDate();

        len = lstday.length;

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

}