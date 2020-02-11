package com.zhiwei.service;

import com.zhiwei.resultBase.FileResult;
import com.zhiwei.util.DateUtil;
import com.zhiwei.util.FTPUtil;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.InputStream;
import java.time.LocalDateTime;

/**
 * Created by jick on 2019/3/26.
 */
@Service
public class FileUploadService  {

   // private  String   host="192.168.100.25";
   // private  String   host="118.31.67.29";
   // private  String   host="192.168.0.182";

  // private  String   host="61.190.20.58";
    @Value("${ftp.host}")
    private  String   host;

    //private Integer port=21;
    //private Integer port=22;
   // private Integer port=1024;

    @Value("${ftp.port}")
    private  Integer  port;

    //private String username="ftpuser";
    // private String username="user2";

    @Value("${ftp.username}")
     private  String  username;


   // private String password="greeqwe678";
  // private String password="egodylan";

    @Value("${ftp.password}")
    private  String password;

    //图片存放路径
    //private String path="/home/ftpuser/ego/";
    //private String path="/home/user2/ego/";
    @Value("${ftp.path}")
    private   String path;


    //视频存放的路径

   // private  String videoPath="/home/newah/test";
    @Value("${ftp.videoPath}")
    private  String videoPath;

   /*private static final String host = "118.31.67.29";
    private static final int port = 22;
    private static final String username = "user2";
    private static final String password = "greeqwe678";*/
   // public static final String path = "/home/user2/ego/";

    @Value("${ftp.imagePort}")
    private  String imagePort;

    @Value("${ftp.videoPort}")
    private String  videoPort;

    @Value("${ftp.domain}")
    private  String domain;


    /**
     * ftp.host=192.168.100.25
     ftp.port=21
     ftp.username=ftpuser
     ftp.password=egodylan
     ftp.path=/home/ftpuser/ego/
     * @param fileName
     * @param inputStream
     * @return
     */


    /*
      文件上传
     */
  /*  public FileResult fileUpload(String fileName, InputStream inputStream) {
        SFTPUtils sf = SFTPUtils.getInstance();
        String  result = sf.upload(path , fileName,inputStream);    //上传文件;
      //  sf.disconnect();//关闭连接
        //创建返回对象
        FileResult   fr  =  new FileResult();
        if(null==result){
            fr.setError("error");
            fr.setMessage("文件上传失败");
            return    fr;
        }

        //最终存储至数据库的文件地址为 ip/2019/03/26/resutlt
        fr.setSuccess("success");
        fr.setFileUrl(result);
        return    fr;
    }
*/


   public FileResult fileUpload(String fileName, InputStream inputStream) {
      //构建日期时间路径  /home/ftpuser/ego/2019/03/26
        String  dateStr = DateUtil.getDateStr(LocalDateTime.now(),DateUtil.pattern_date);
        String     basePath =   path + dateStr;

        //文件上传成功返回服务器文件名
        String  result   = FTPUtil.fileUpload(host,port,username,password,basePath,fileName,inputStream);

        //创建返回对象
        FileResult   fr  =  new FileResult();
        if(null==result){
            fr.setError("error");
            fr.setMessage("文件上传失败");
            return    fr;
        }

        //最终存储至数据库的文件地址为 ip/2019/03/26/resutlt
        fr.setSuccess("success");
       // fr.setFileUrl("http://"+host+":8811/"+dateStr+"/"+result);
      // fr.setFileUrl("http://61.190.20.53:8811/"+dateStr+"/"+result);
      // fr.setFileUrl("http://www.ah-gree.com:8811/"+dateStr+"/"+result);
       //domain
       fr.setFileUrl("http://"+domain+":"+imagePort+"/"+dateStr+"/"+result);

        return    fr;
    }

    public boolean fileDelete(String pathName) {
      //  SFTPUtils sf = SFTPUtils.getInstance();
        //return true;http://118.31.67.29:8811/a7b2994ed6364612afab6aa7d49e9c7d.jpg
        //sf.delete(path,pathName.split("/")[3]);
        // fileDelete
        // fileDelete(String host,Integer port,String username,
       // String password,String pathName,String path){
       return  FTPUtil.fileDelete(host,port,username,password,pathName,path);
      //  return true;
    }

    /**
     * 视频文件删除
     *
     */

    public boolean videoDelete(String pathName) {

        return  FTPUtil.videoDelete(host,port,username,password,pathName,videoPath);
        //  return true;
    }



    /**
     * 视频上传
     */
    public FileResult videoUpload(String fileName, InputStream inputStream) {


        //文件上传成功返回服务器文件名
        String  result   = FTPUtil.fileUpload(host,port,username,password,videoPath,fileName,inputStream);

        //创建返回对象
        FileResult   fr  =  new FileResult();
        if(null==result){
            fr.setError("error");
            fr.setMessage("文件上传失败");
            return    fr;
        }

        //最终存储至数据库的文件地址为 ip/2019/03/26/resutlt
        //http://118.31.67.29:8036/aa.mp4
        fr.setSuccess("success");
        //fr.setFileUrl("http://"+host+":8036/"+result);
       // fr.setFileUrl("http://61.190.20.53:8036/"+result);
       // fr.setFileUrl("http://www.ah-gree.com:8036/"+result);
        fr.setFileUrl("http://"+domain+":"+videoPort+"/"+result);

        return    fr;
    }




}
