package daos.painDao;

import beans.painBean;
import beans.testBean;
import daos.DAOException;
import daos.dao_factory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class painTestDaoImpl implements painTestDao{
    private dao_factory DAO;
    public painTestDaoImpl(dao_factory daoFactory){this.DAO = daoFactory;};

    private testBean map(ResultSet resultSet ) throws SQLException {
        testBean testBean = new testBean();

        testBean.setResult(resultSet.getString("result"));
        testBean.setUser_id(resultSet.getInt("user_id"));

        return testBean;
    }
    public static PreparedStatement initRequestPrepare(Connection connexion, String sql, Object... objets ) throws SQLException {
        PreparedStatement preparedStatement = connexion.prepareStatement( sql );
        for ( int i = 0; i < objets.length; i++ ) {
            preparedStatement.setObject( i + 1, objets[i] );
        }
        return preparedStatement;
    }

    public void create(testBean test) throws DAOException {
        final String SQL_INSERT = "INSERT INTO tests (result,user_id) VALUES (?,?)";

        try (Connection connexion = DAO.getConnection();
             PreparedStatement preparedStatement = initRequestPrepare(connexion, SQL_INSERT,test.getResult(), test.getUser_id())) {

            int statut = preparedStatement.executeUpdate();
            if (statut == 0) {
                throw new DAOException("Échec de la création de l'utilisateur, aucune ligne ajoutée dans la table.");
            }
        } catch (SQLException e) {
            throw new DAOException(e);
        }
    }

    @Override
    public testBean find(int user_id) throws DAOException {
        final String SQL_QUERY = "SELECT result, user_id FROM tests WHERE user_id = ? AND created_at = (SELECT MAX(created_at) FROM tests)";
        ResultSet resultSet = null;
        testBean testBean = null;
        try (Connection connexion = DAO.getConnection();
             PreparedStatement preparedStatement = initRequestPrepare(connexion, SQL_QUERY, user_id)) {

            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                testBean  = map(resultSet);
            }
        } catch (SQLException e) {
            throw new DAOException(e);
        }
        return testBean;
    }
}
