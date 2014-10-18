package models;

import javax.persistence.*;
import play.db.ebean.*;
import com.avaje.ebean.*;
import java.util.Date;

@Entity
public class Task extends Model
{
	@Id
	public Long id;
	public String title;
	public boolean done;
	public Date dueDate;
	@ManyToOne
	public Project project;
	
	public static Finder<Long, Task> find = new Finder<Long, Task>(Long.class, Task.class);
	
	public Task(String title, Project project)
	{
		this.title = title;
		this.project = project;
	}
	
	public static Task create(String title, Long projectId)
	{
		Task task = new Task(title, Project.find.ref(projectId));
		task.save();
		return task;
		
	}
	
	

}