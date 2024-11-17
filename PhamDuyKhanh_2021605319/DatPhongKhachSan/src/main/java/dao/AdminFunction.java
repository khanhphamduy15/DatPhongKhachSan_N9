package dao;

import db.ConnectionPool;

public interface AdminFunction {

	boolean login(String username, String password);

	ConnectionPool getCP();

	void releaseConnection();

}
