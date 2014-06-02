package db_action;

import java.sql.SQLException;
public class main_class {
	public static void main(String[] args) throws SQLException{
		Set_db set_db = null;
		set_db = new Set_db();
		set_db.main_action("1");
	}
}
