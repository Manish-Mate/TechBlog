/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;

/**
 *
 * @author Manish
 */
import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import java.sql.*;

import java.util.*;

public class PostDao {

    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

    public ArrayList<Category> getAllCategories() {
        ArrayList<Category> list = new ArrayList<>();

        try {
            String q = "select * from categories";
            PreparedStatement p = this.con.prepareStatement(q);
            ResultSet set = p.executeQuery();
            while (set.next()) {
                int cid = set.getInt("cid");
                String name = set.getString("name");
                String description = set.getString("description");

                Category c = new Category(cid, name, description);
                list.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
//        public ArrayList<Category> getAllCategoriesOfId(int id) {
//        ArrayList<Category> list = new ArrayList<>();
//
//        try {
//            String q = "select * from categories where id=?";
//            PreparedStatement p = this.con.prepareStatement(q);
//             p.setInt(1,id);
//            ResultSet set=p.executeQuery();
//            
//            while (set.next()) {
//                int cid = set.getInt("cid");
//                String name = set.getString("name");
//                String description = set.getString("description");
//
//                Category c = new Category(cid, name, description);
//                list.add(c);
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return list;
//    }

    public boolean savePost(Post post) {
        boolean f = false;
        try {
//            String q="insert int posts(pTitle,pContent,pCode,pPic,catId,userId) values(?,?,?,?,?,?)";
            String q = "insert into posts(pTitle,pContent,pCode,pPic,catId,userId) values(?,?,?,?,?,?)";

            PreparedStatement p = this.con.prepareStatement(q);
            p.setString(1, post.getpTitle());
            p.setString(2, post.getpContent());
            p.setString(3, post.getpCode());
            p.setString(4, post.getpPic());
            p.setInt(5, post.getCatId());
            p.setInt(6, post.getUserId());
            p.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public List<Post> getAllPosts() {
        List<Post> list = new ArrayList<>();
        
        try{
            
            PreparedStatement p= this.con.prepareStatement("select * from posts order by pid desc");
            
            ResultSet set=p.executeQuery();
            while(set.next())
            {
                int pid=set.getInt("pid");
                String pTitle=set.getString("pTitle");
                String pContent=set.getString("PContent");
                String pCode=set.getString("pCode");
                String pPic=set.getString("pPic");
                Timestamp date=set.getTimestamp("pDate");
                int catId=set.getInt("catId");
                int userId=set.getInt("userId");
                
                Post post=new Post(pid,pTitle,pContent,pCode,pPic,date,catId,userId);
                list.add(post);
            }
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return list;
    }
      public List<Post> getAllPosts(int uid) {
        List<Post> list = new ArrayList<>();
        
        try{
            
            PreparedStatement p= this.con.prepareStatement("select * from posts where userId=? order by pid desc");
            p.setInt(1,uid);
            
            ResultSet set=p.executeQuery();
            while(set.next())
            {
                int pid=set.getInt("pid");
                String pTitle=set.getString("pTitle");
                String pContent=set.getString("PContent");
                String pCode=set.getString("pCode");
                String pPic=set.getString("pPic");
                Timestamp date=set.getTimestamp("pDate");
                int catId=set.getInt("catId");
                int userId=set.getInt("userId");
                
                Post post=new Post(pid,pTitle,pContent,pCode,pPic,date,catId,userId);
                list.add(post);
            }
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return list;
    }

    public List<Post> getPostByCatId(int catId) {
        List<Post> list = new ArrayList<>();

        try{
            
            PreparedStatement p= this.con.prepareStatement("select * from posts where catId=? order by pid desc");
            p.setInt(1,catId);
            ResultSet set=p.executeQuery();
            while(set.next())
            {
                int pid=set.getInt("pid");
                String pTitle=set.getString("pTitle");
                String pContent=set.getString("PContent");
                String pCode=set.getString("pCode");
                String pPic=set.getString("pPic");
                Timestamp date=set.getTimestamp("pDate");

                int userId=set.getInt("userId");
                
                Post post=new Post(pid,pTitle,pContent,pCode,pPic,date,catId,userId);
                list.add(post);
            }
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return list;
    }
    public List<Post> getPostByCatId(int catId,int uid) {
        List<Post> list = new ArrayList<>();

        try{
            
            PreparedStatement p= this.con.prepareStatement("select * from posts where catId=? and userId=? order by pid desc");
            p.setInt(1,catId);
            p.setInt(2, uid);
            ResultSet set=p.executeQuery();
            while(set.next())
            {
                int pid=set.getInt("pid");
                String pTitle=set.getString("pTitle");
                String pContent=set.getString("PContent");
                String pCode=set.getString("pCode");
                String pPic=set.getString("pPic");
                Timestamp date=set.getTimestamp("pDate");

                int userId=set.getInt("userId");
                
                Post post=new Post(pid,pTitle,pContent,pCode,pPic,date,catId,userId);
                list.add(post);
            }
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return list;
    }
    public Post getPostByPostId(int postId)
    {
        Post post=null;
        try
        {
            String q1="select * from posts where pid=?";
        PreparedStatement p=con.prepareStatement(q1);
            p.setInt(1,postId);
            ResultSet set=p.executeQuery();
            if(set.next())
            {
              int pid=set.getInt("pid");
                String pTitle=set.getString("pTitle");
                String pContent=set.getString("PContent");
                String pCode=set.getString("pCode");
                String pPic=set.getString("pPic");
                Timestamp date=set.getTimestamp("pDate");
                int catId=set.getInt("catId");
                int userId=set.getInt("userId");
                
                 post=new Post(pid,pTitle,pContent,pCode,pPic,date,catId,userId);
              
            }
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        return post;
    }
}
