package web.mutbrocha.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import web.mutbrocha.model.User;
import web.mutbrocha.repository.helper.user.UserQueries;


@Repository
public interface UserRepository extends JpaRepository<User, Long>, UserQueries{
	
	User findByusername(String username);

}
