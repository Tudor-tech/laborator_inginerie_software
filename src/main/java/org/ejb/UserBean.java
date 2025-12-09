package org.ejb;
import jakarta.ejb.EJBException;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;
import org.example.parkinglot.entities.User;
import org.parkinglot.parkinglot.common.UserDto;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

@Stateless
public class UserBean {
    private static final Logger LOG = Logger.getLogger(UserBean.class.getName());

    @PersistenceContext
    EntityManager entityManager;

    public List<UserDto> findAllUsers() {
        LOG.info("findAllUsers");
        try{
            TypedQuery<User> typedQuery = entityManager.createQuery("SELECT u from User u", User.class);
            List<User> users = typedQuery.getResultList();
            return copyUsersToDto(users);
        }catch (Exception ex){
            throw new EJBException(ex);
        }
    }

    private List<UserDto> copyUsersToDto(List<User> users) {
        List<UserDto> dtos = new ArrayList<>();

        for (User user : users) {
            UserDto dto = new UserDto(user.getUsername(), user.getId(), user.getPassword(), user.getEmail());
            dtos.add(dto);
        }
        return dtos;
    }
}
