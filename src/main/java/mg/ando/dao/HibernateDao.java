package mg.ando.dao;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import org.hibernate.criterion.Example;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import mg.ando.model.Element;

public class HibernateDao {

    private SessionFactory sessionFactory;

//    generalize
    public <T> T create(T entity) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.saveOrUpdate(entity);
        transaction.commit();
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
    public List<Object> selectWpagination(Class<?> clazz, int first_element, int max_result) throws Exception {
        List<Object> data = new ArrayList<>();
        Session session = null;
        try {
            session = sessionFactory.openSession();
            session.beginTransaction();
            Query query = session.createQuery("from " + clazz.getSimpleName() + " where (statut = 1) and (date_publication <= now())");
            query.setFirstResult(first_element);
            query.setMaxResults(max_result);
            for (Object row : query.list()) {
                data.add(row);
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        } finally {
            session.close();
        }
        return data;
    }

    public List<Object> selectWhere(Class<?> clazz, String pattern) throws Exception {
        Session session = sessionFactory.openSession();
        try {
            Criteria criteria = session.createCriteria(clazz);
            criteria.add(Restrictions.like("titre", "%" + pattern + "%").ignoreCase());
            criteria.add(Restrictions.eq("statut", 1));
            return criteria.list();
        } finally {
            session.close();
        }
    }

    public Object login(Class<?> clazz, String username, String password) {
        Session session = sessionFactory.openSession();
        try {
            Criteria criteria = session.createCriteria(clazz);
            criteria.add(Restrictions.eq("email", username));
            criteria.add(Restrictions.eq("mdp", password));
            Object user = criteria.uniqueResult();
            return user;
        } finally {
            session.close();
        }
    }

    public List<Object> selectNonPubliees(Class<?> clazz) throws Exception {
        Session session = sessionFactory.openSession();
        try {
            Criteria criteria = session.createCriteria(clazz);
            criteria.add(Restrictions.eq("statut", 0));
            return criteria.list();
        } finally {
            session.close();
        }
    }
    
    public List<Element> selectFavoris() throws Exception {
        Session session = sessionFactory.openSession();
        try {
            Criteria criteria = session.createCriteria(Element.class);
            criteria.add(Restrictions.isNotNull("favori"));
            criteria.addOrder(Order.desc("favori"));
            return criteria.list();
        } finally {
            session.close();
        }
    }
    
    public List<Element> selectNotFavoris() throws Exception {
        Session session = sessionFactory.openSession();
        try {
            Criteria criteria = session.createCriteria(Element.class);
            criteria.add(Restrictions.isNull("favori"));
            criteria.addOrder(Order.desc("date_publication"));
            return criteria.list();
        } finally {
            session.close();
        }
    }
    
    public List<Element> selectByAuteur(int id_auteur) throws Exception {
        Session session = sessionFactory.openSession();
        try {
            Criteria criteria = session.createCriteria(Element.class);
            criteria.add(Restrictions.eq("id_auteur", id_auteur));
            return criteria.list();
        } finally {
            session.close();
        }
    }
    
}
