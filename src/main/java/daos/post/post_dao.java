package daos.post;

import java.util.ArrayList;

import beans.post;

public interface post_dao {
	public void create(int user_id, String title, String description, String image);
	public void update(post blog);
	public void delete(int blog_id);
	public ArrayList<post> all();
	public post one(int blog_id);

}
