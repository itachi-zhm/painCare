package daos.comment;

import java.util.ArrayList;

import beans.comment;

public interface comment_dao {
	public void create(int user_id, int blog_id, String content);
	public void delete(int comment_id);
	public comment get_one(int comment_id);
	public ArrayList<comment> blogComments(int blog_id);

}
