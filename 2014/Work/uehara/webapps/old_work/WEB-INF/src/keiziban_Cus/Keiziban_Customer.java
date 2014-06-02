package keiziban_Cus;

import java.util.ArrayList;
import java.util.Calendar;

public class Keiziban_Customer implements java.io.Serializable {

	public ArrayList<String> namelist;
	public ArrayList<String> kenmeilist;
	public ArrayList<String> komentlist;
	public ArrayList<String> numlist;
	public ArrayList<String> daylist;

	// 名前取得
	public void setName(String NAME) {
		this.namelist.add(NAME);
	}

	public ArrayList<String> getName() {
		return this.namelist;
	}

	// 件名取得
	public void setkenmei(String KENMEI) {
		this.kenmeilist.add(KENMEI);
	}

	public ArrayList<String> getKenmei() {
		return this.kenmeilist;
	}

	// コメント取得
	public void setkoment(String KOMENT) {
		this.komentlist.add(KOMENT);
	}

	public ArrayList<String> getKoment() {
		return this.komentlist;
	}

	// ナンバー取得
	public void setNum(int NUM) {
		this.numlist.add(String.valueOf(NUM));
	}

	public ArrayList<String> getNum() {
		return this.numlist;
	}

	// 日時取得
	public void setDay() {
		Calendar now = Calendar.getInstance();
		int year = now.get(Calendar.YEAR);
		int month = now.get(Calendar.MONTH) + 1;
		int day = now.get(Calendar.DATE);
		int hour = now.get(Calendar.HOUR_OF_DAY);
		int minute = now.get(Calendar.MINUTE);
		String weekDay = String.format("%1$ta", now);
		String dad = year + "/" + month + "/" + day + "（" + weekDay + "）"
				+ hour + ":" + minute;
		this.daylist.add(dad);
	}

	public ArrayList<String> getDay() {
		return this.daylist;
	}
}
