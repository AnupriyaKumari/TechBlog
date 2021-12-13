package com.tech.blog.dao;

import java.sql.*;

/**
 *
 * @author ANUPRIYA
 */
public class LikeDao {

    Connection con;

    public LikeDao(Connection con) {
        this.con = con;

    }

    public boolean insertLike(int pId, int uid) {
        boolean f = false;
        try {
            
            String q="insert into liked(pId, uid)values(?,?)";
            PreparedStatement p = this.con.prepareStatement(q);
//            values set
            p.setInt(1, pId);
            p.setInt(2, uid);
            p.executeUpdate();
            f=true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;

    }
    
    public int countLikeOnPost(int pId){
        int count=0;
        try{
            
        String q="select count(*) from liked where pId=?";
        PreparedStatement p = this.con.prepareStatement(q);
        p.setInt(1, pId);
        ResultSet set = p.executeQuery();
        if(set.next()){
            count=set.getInt("count(*)");
        }
     
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return count;
    }
    
    public boolean isLikedByUser(int pId , int uid){
        boolean f = false;
        try{
            PreparedStatement p = this.con.prepareStatement("select * from liked where pId=? and uid=?");
            p.setInt(1, pId);
            p.setInt(2, uid);
            ResultSet set = p.executeQuery();
            if(set.next()){
                f=true;
            }
         
        }catch(Exception e){
            e.printStackTrace();
        }
       
        return f;
        
    }
    
    public boolean deleteLike(int pId , int uid){
        boolean f=false;
        try{
            PreparedStatement p = this.con.prepareStatement("delete from liked where pId=? and uid=?");
            p.setInt(1, pId);
            p.setInt(2, uid);
            p.executeUpdate();
            f=true;
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return f;
    }
}
