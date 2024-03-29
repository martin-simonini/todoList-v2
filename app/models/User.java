package models;

import javax.persistence.*;
import play.db.ebean.*;
import com.avaje.ebean.*;
import java.util.*;

@Entity
public class User extends Model{

	@Id
	public String email;
	public String username;
	public String password;
	
	public User(String email, String name, String password){
		this.email = email;
		this.username = name;
		this.password = password;
	}
	
	public static Finder<String, User> find = new Finder<String, User>(String.class, User.class);
	
}