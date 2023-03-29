package mg.ando.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import org.hibernate.criterion.Example;
import org.hibernate.criterion.Order;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import mg.ando.model.Scene;
import mg.ando.type.AgendaType;
import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.criterion.Restrictions;

public class HibernateDao {

	private SessionFactory sessionFactory;

//    generalize
	public <T> T create(T entity) {
		Session session = sessionFactory.openSession();
		session.saveOrUpdate(entity);
		session.close();
		return entity;
	}

	public <T> T findById(Class<T> clazz, Serializable id) {
		Session session = sessionFactory.openSession();
		T entity = (T) session.get(clazz, id);
		session.close();
		return entity;
	}

	public <T> List<T> findAll(Class<T> tClass) {
		Session session = sessionFactory.openSession();
		List<T> results = session.createCriteria(tClass).list();
		session.close();
		return results;
	}

	public <T> List<T> findWhere(T entity) {
		Session session = sessionFactory.openSession();
		Example example = Example.create(entity).ignoreCase();
		List<T> results = session.createCriteria(entity.getClass()).add(example).list();
		session.close();
		return results;
	}

	public <T> List<T> paginateWhere(T entity, int offset, int size) {
		Session session = sessionFactory.openSession();
		Example example = Example.create(entity).ignoreCase();
		List<T> results = session.createCriteria(entity.getClass())
				.add(example)
				.setFirstResult(offset)
				.setMaxResults(offset + size).list();
		session.close();
		return results;
	}

	public <T> List<T> paginate(Class<T> clazz, int offset, int size) {
		Session session = sessionFactory.openSession();
		List<T> results = session.createCriteria(clazz)
				.setFirstResult(offset)
				.setMaxResults(offset + size).list();
		session.close();
		return results;
	}

	public <T> List<T> paginate(Class<T> clazz, int offset, int size, String orderBy, boolean orderAsc) {
		Session session = sessionFactory.openSession();
		Order order = (orderAsc) ? Order.asc(orderBy) : Order.desc(orderBy);
		List<T> results = session.createCriteria(clazz)
				.addOrder(order)
				.setFirstResult(offset)
				.setMaxResults(offset + size).list();
		session.close();
		return results;
	}

	public void deleteById(Class tClass, Serializable id) {
		delete(findById(tClass, id));
	}

	public void delete(Object entity) {
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.delete(entity);
		transaction.commit();
		session.close();
	}

	public <T> T update(T entity) {
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.saveOrUpdate(entity);
		transaction.commit();
		session.close();
		return entity;
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

//    spec...
	public List<Object> selectSceneDetail(Class<?> clazz, int idScene) throws Exception {
		Session session = sessionFactory.openSession();
		try {
			Criteria criteria = session.createCriteria(clazz);
			criteria.add(Restrictions.eq("sceneid", idScene));
			return criteria.list();
		} finally {
			session.close();
		}
	}

	public List<Object> selectSceneFilm(Class<?> clazz, int idFilm) throws Exception {
		Session session = sessionFactory.openSession();
		try {
			Criteria criteria = session.createCriteria(clazz);
			criteria.add(Restrictions.eq("filmid", idFilm));
			return criteria.list();
		} finally {
			session.close();
		}
	}

	public List<AgendaType> selectAgendaFilm(String idFilm) throws Exception  {
		List<AgendaType> result = new ArrayList<>();
		Session session = sessionFactory.openSession();
		SQLQuery query = session.createSQLQuery(String.format("select * from agendaScene(%s)", idFilm));
		List<Object[]> rows = query.list();
		for (Object[] row : rows) {
			AgendaType tmp = new AgendaType();

			tmp.setIdScene((int) row[0]);
			tmp.setIdPlateau((int) row[1]);
			tmp.setPlateau((String) row[2]);
			tmp.setDuree((float) row[3]);
			tmp.setJour((int) row[4]);

			result.add(tmp);
		}

		return result;
	}
	
	public void updateScene(Scene s) {
		Session session = sessionFactory.openSession();
		session.update(s);
	}

}
