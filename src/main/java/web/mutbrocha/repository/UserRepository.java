package web.mutbrocha.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import web.mutbrocha.model.User;


@Repository
public interface UserRepository extends JpaRepository<User, String>{
	
	List<User> findByname(String username);

}
