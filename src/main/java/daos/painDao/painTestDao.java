package daos.painDao;

import beans.painBean;
import beans.testBean;
import daos.DAOException;

public interface painTestDao {
    void create( testBean test ) throws DAOException;
    testBean find(int user_id) throws DAOException;

}
