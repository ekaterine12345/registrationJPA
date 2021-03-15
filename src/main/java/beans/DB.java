package beans;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;
import  javax.persistence.Query;
import javax.persistence.Persistence;


public class DB {

    public DB() {
        System.out.println("DB");
    }

    public boolean saveUser(AppUsers appUser) {

        if (appUser.getId() ==0 || appUser.getLastname() == null || appUser.getName() == null || appUser.getPassword() == null) {
            return false;
        }




        try {
        EntityManagerFactory factory= Persistence.createEntityManagerFactory("test_jdbc");
        EntityManager entityManager=factory.createEntityManager();
        entityManager.getTransaction().begin();


        entityManager.persist(appUser);
        entityManager.getTransaction().commit();
        entityManager.close();
        factory.close();
        } catch (EntityExistsException e) {
            e.printStackTrace();
            return false;
        }

        return true;
    }



    public boolean deleteUser(AppUsers appUser) {

        try {

            EntityManagerFactory factory= Persistence.createEntityManagerFactory("test_jdbc");
            EntityManager entityManager=factory.createEntityManager();
            entityManager.getTransaction().begin();

            AppUsers appUsers1=entityManager.find(AppUsers.class,appUser.getId());

            entityManager.remove(appUsers1);
            entityManager.getTransaction().commit();
            entityManager.close();
            factory.close();


        } catch (EntityExistsException e) {
            e.printStackTrace();
            return false;
        }

        return true;
    }

    public boolean updateUser(AppUsers appUser) {


            appUser.setId(Math.abs(appUser.getId()));
        try {
            EntityManagerFactory factory= Persistence.createEntityManagerFactory("test_jdbc");
            EntityManager entityManager=factory.createEntityManager();
            entityManager.getTransaction().begin();

            entityManager.merge(appUser);
            entityManager.flush();

            entityManager.getTransaction().commit();
            entityManager.close();
            factory.close();

        } catch (EntityExistsException e) {
            e.printStackTrace();
            return false;
        }

        return true;
    }



    public List<AppUsers> getAllRecods() {
        List<AppUsers> appUsersList = new ArrayList<AppUsers>();

        try {
            EntityManagerFactory factory= Persistence.createEntityManagerFactory("test_jdbc");
            EntityManager entityManager=factory.createEntityManager();


       Query query =entityManager.createQuery("from AppUsers ap");

            appUsersList=query.getResultList();

        } catch (EntityExistsException e) {
            e.printStackTrace();
        }


        return appUsersList;
    }

    public AppUsers getRecordById(int id) {


        try {
            EntityManagerFactory factory= Persistence.createEntityManagerFactory("test_jdbc");
            EntityManager entityManager=factory.createEntityManager();
            entityManager.getTransaction().begin();

            AppUsers appUsers=entityManager.find(AppUsers.class,id);


                return appUsers;


        } catch (EntityExistsException e) {
            e.printStackTrace();
        }


        return null;

    }

}

