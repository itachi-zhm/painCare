package daos.painDao;

import beans.painBean;
import beans.user;
import daos.DAOException;
import daos.dao_factory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class painDaoImpl implements painDao{

    private dao_factory DAO;

    public painDaoImpl(dao_factory daoFactory){this.DAO = daoFactory;};

    private painBean map(ResultSet resultSet ) throws SQLException {
        painBean painBean = new painBean();
        painBean.setId(resultSet.getInt("id"));
        painBean.setLevel(resultSet.getInt("level"));
        painBean.setLocation(resultSet.getString("location"));
        painBean.setPainWorse(resultSet.getString("painWorse"));
        painBean.setFeeling(resultSet.getString("feeling"));
        painBean.setSymptoms(resultSet.getString("symptoms"));
        painBean.setCreated_at(resultSet.getDate("created_at"));
        painBean.setId_user(resultSet.getInt("id_user"));

        return painBean;
    }
    public static PreparedStatement initRequestPrepare(Connection connexion, String sql, Object... objets ) throws SQLException {
        PreparedStatement preparedStatement = connexion.prepareStatement( sql );
        for ( int i = 0; i < objets.length; i++ ) {
            preparedStatement.setObject( i + 1, objets[i] );
        }
        return preparedStatement;
    }

    @Override
    public ArrayList<painBean> getAllPains(int id) throws DAOException {
        final String SQL_SELECT = "SELECT * FROM pain";
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        painBean painBean = null;
        ArrayList<painBean> pains = new ArrayList<painBean>();
        try {
            /* Récupération d'une connexion depuis la Factory */
            connexion = DAO.getConnection();
            preparedStatement = initRequestPrepare( connexion, SQL_SELECT);
            resultSet = preparedStatement.executeQuery();
            /* Parcours de la ligne de données de l'éventuel ResulSet retourné */
            while ( resultSet.next() ) {

                painBean = map( resultSet );
                pains.add(painBean);
            }
        } catch ( SQLException e ) {
            throw new DAOException( e );
        }
        return pains;
    }

    @Override
    public void create(painBean pain) throws DAOException {
        final String SQL_INSERT = "INSERT INTO pain (level,location, symptoms, painWorse, feeling, id_user) VALUES (?,?, ?, ?, ?, ?)";

        try (Connection connexion = DAO.getConnection();
             PreparedStatement preparedStatement = initRequestPrepare(connexion, SQL_INSERT,pain.getLevel(), pain.getLocation(),  pain.getSymptoms(),pain.getPainWorse(), pain.getFeeling(), pain.getId_user())) {

            int statut = preparedStatement.executeUpdate();
            if (statut == 0) {
                throw new DAOException("Échec de la création de l'utilisateur, aucune ligne ajoutée dans la table.");
            }
        } catch (SQLException e) {
            throw new DAOException(e);
        }
    }

    @Override
    public void delete(int id) throws DAOException {

    }

    @Override
    public painBean find(int id) throws DAOException {
        return null;
    }

    @Override
    public void update(painBean pain) throws DAOException {

    }
}
