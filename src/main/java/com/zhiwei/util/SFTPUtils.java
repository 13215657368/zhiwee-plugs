package com.zhiwei.util;
import com.jcraft.jsch.*;
import org.slf4j.*;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
public class SFTPUtils {

    private  static org.slf4j.Logger LOG  = LoggerFactory.getLogger(SFTPUtils.class);
 
   private static final String host = "118.31.67.29";
    private static final int port = 22;
    private static final String username = "user2";
    private static final String password = "greeqwe678";
  //  public static final String directory = "/home/user2/ego/";

 
    private static ChannelSftp sftp;

    private static SFTPUtils instance = null;
 
    private SFTPUtils() {
    }
 
    public static SFTPUtils getInstance() {
        if (instance == null) {
            if (instance == null) {
                instance = new SFTPUtils();
                sftp = instance.connect(host, port, username, password);   //获取连接
            }
        }
        return instance;
    }
 
    /**
     * 连接sftp服务器
     *
     * @param host     主机
     * @param port     端口
     * @param username 用户名
     * @param password 密码
     * @return
     */
    public  static ChannelSftp connect(String host, int port, String username, String password) {
        ChannelSftp sftp = null;
        try {
            JSch jsch = new JSch();
            jsch.getSession(username, host, port);
            Session sshSession = jsch.getSession(username, host, port);
            sshSession.setPassword(password);
            Properties sshConfig = new Properties();
            sshConfig.put("StrictHostKeyChecking", "no");
            sshSession.setConfig(sshConfig);
            sshSession.connect();
            LOG.info("SFTP Session connected.");
            Channel channel = sshSession.openChannel("sftp");
            channel.connect();
            sftp = (ChannelSftp) channel;
            LOG.info("Connected to " + host);
        } catch (Exception e) {
            LOG.error(e.getMessage());
        }
        return sftp;
    }
 
    /**
     * 上传文件
     *
     * @param directory  上传的目录
     *
     */
    public   String  upload(String directory, String fileName,InputStream fileInputStream) {
       // connect(host,port,username,password);//建立连接
        try {
            sftp.cd(directory);
           /* File file = new File(uploadFile);
            FileInputStream fileInputStream = new FileInputStream(file);*/
            // String  suffix =  fileName.substring(fileName.lastIndexOf("."));
            String  suffix =  fileName.substring(fileName.lastIndexOf("."));
            String    remote   =  UUIDUtil.getUUID()+suffix;
            sftp.put(fileInputStream, remote);
           // fileInputStream.close();
            return  "http://118.31.67.29:8811/"+remote;
        } catch (Exception e) {
            LOG.error(e.getMessage());
            return "0";
        }finally {
            try {
                disconnect();//关闭
                fileInputStream.close();
            } catch (IOException e1) {
                e1.printStackTrace();
            }
        }


    }
 


    /**
     * 删除文件
     *
     * @param directory  要删除文件所在目录
     * @param deleteFile 要删除的文件
     */
    public   void delete(String directory, String deleteFile) {
        try {
            sftp.cd(directory);
            sftp.rm(deleteFile);
        } catch (Exception e) {
            LOG.error(e.getMessage());
        }
    }
 
    public  static void disconnect() {
        try {
            sftp.getSession().disconnect();
        } catch (JSchException e) {
            LOG.error(e.getMessage());
        }
        sftp.quit();
        sftp.disconnect();
    }
 

 
    public static void main(String[] args) throws IOException {
        SFTPUtils sf = SFTPUtils.getInstance();
        File file = new File("d:\\img.jpg");
        InputStream fileInputStream = new FileInputStream(file);
     //   String  path = sf.upload(directory, file.getName(),fileInputStream);    //上传文件
      //  System.out.println(path);
       // System.out.println(path.split("/")[3]);

         // sf.delete(directory, "img.jpg"); //删除文件
        sf.disconnect();
    }
}
