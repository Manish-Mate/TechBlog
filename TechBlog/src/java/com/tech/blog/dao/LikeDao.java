package com.tech.blog.dao;

import java.sql.*;

public class LikeDao {

    Connection con;

    public LikeDao(Connection con) {
        this.con = con;
    }

    public boolean inserLike(int pid, int uid) {
        boolean f = false;
        try {
            String q = "insert into liked(pid,uid) values(?,?)";
            PreparedStatement pstm = this.con.prepareStatement(q);
            pstm.setInt(1, pid);
            pstm.setInt(2, uid);

            pstm.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public int countLikeOnPost(int pid) {
        int count = 0;
        try {
            String q = "select count(*) from liked where pid=?";
            PreparedStatement p = this.con.prepareStatement(q);
            p.setInt(1,pid);
            ResultSet set=p.executeQuery();
            if(set.next()){
                count=set.getInt("count(*)");
            }
        }catch(Exception e)
        {
            e.printStackTrace();
        }

        return count;
    }
    
    public boolean isLikedByUser(int pid,int uid)
    {
        boolean f=false;
        try{
            PreparedStatement pstm=this.con.prepareCall("select * from liked where pid=? and uid=?");
            pstm.setInt(1,pid);
            pstm.setInt(2,uid);
            ResultSet set=pstm.executeQuery();
            if(set.next())
            {
                f=true;
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    public boolean deleteLike(int pid,int uid)
    {
        boolean f=false;
        try{
            PreparedStatement pstm=this.con.prepareCall("delete from liked where pid=? and uid=?");
            pstm.setInt(1,pid);
            pstm.setInt(2,uid);
            pstm.executeUpdate();
            f=true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    
}
