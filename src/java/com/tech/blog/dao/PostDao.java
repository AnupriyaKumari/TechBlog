package com.tech.blog.dao;

import com.tech.blog.entities.*;
import java.sql.*;
import java.util.*;

/**
 *
 * @author ANUPRIYA
 */
public class PostDao {

    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

    public ArrayList<Category> getAllCategories() {
        ArrayList<Category> list = new ArrayList<>();

        try {

            String q = "select * from categories";
            Statement st = this.con.createStatement();
            ResultSet set = st.executeQuery(q);
            while (set.next()) {
                int cId = set.getInt("cId");
                String name = set.getString("name");
                String description = set.getString("description");
                Category c = new Category(cId, name, description);
                list.add(c);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public boolean savePost(Post p) {
        boolean f = false;
        try {
            String q = "insert into posts(pTitle , pContent , pCode , pPic , catId , userId ) values(?,?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(q);
            pstmt.setString(1, p.getpTitle());
            pstmt.setString(2, p.getpContent());
            pstmt.setString(3, p.getpCode());
            pstmt.setString(4, p.getpPic());
            pstmt.setInt(5, p.getCatId());
            pstmt.setInt(6, p.getUserId());

            pstmt.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    //method to get all posts
    public List<Post> getAllPost() {
        List<Post> list = new ArrayList<Post>();
        //fetch all posts
        try {
            PreparedStatement p = con.prepareStatement("select * from posts order by pId desc");
            ResultSet set = p.executeQuery();
            while (set.next()) {
                int pId = set.getInt("pId");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int catId = set.getInt("catId");
                int userId = set.getInt("userId");
                Post post = new Post(pId, pTitle, pContent, pCode, pPic, date, catId, userId);
                list.add(post);
            }

        } catch (Exception e) {
            e.printStackTrace();

        }
        return list;
    }

    public List<Post> getPostByCatId(int catId) {

        List<Post> list = new ArrayList<>();
//        fetch all post by id
        try {
            PreparedStatement p = con.prepareStatement("select * from posts where catId=?");
            p.setInt(1, catId);
            ResultSet set = p.executeQuery();
            while (set.next()) {
                int pId = set.getInt("pId");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                
                int userId = set.getInt("userId");
                Post post = new Post(pId, pTitle, pContent, pCode, pPic, date, catId, userId);
                list.add(post);
            }

        } catch (Exception e) {
            e.printStackTrace();

        }

        return list;
    }

    
    public Post getPostByPostId(int postId){
        Post post = null;
        String q= "select * from posts where pId=?";
        try{
        PreparedStatement p = this.con.prepareStatement(q);
        p.setInt(1, postId);
        
        ResultSet set =p.executeQuery();
       if(set.next()){
           
            int pId = set.getInt("pId");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int cId= set.getInt("catId");
                int userId = set.getInt("userId");
                post = new Post(pId, pTitle, pContent, pCode, pPic, date, cId, userId);
          
       }
        
        }catch(Exception e){
            e.printStackTrace();
        }
        return post;
        
    }
}
