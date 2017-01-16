package com.laozhang.utils.ftp;

public class FtpTest {
	public static void main(String[] args) {
		//上传文件
		upload();
		//下载文件
		//download();
		//创建文件夹
		//mkdir();
	}
	
	private static void mkdir() {
		FtpClientUtil clientUtil=new FtpClientUtil();  
        clientUtil.mkdir("test");
	}
	
	private static void download() {
		String remoteFileName="./111.txt";  
        String locaFileName="C:/Users/zhangchengfu/Desktop/cms.json";  
        FtpClientUtil clientUtil=new FtpClientUtil();  
        clientUtil.download(remoteFileName, locaFileName);
	}
	
	private static void upload() {  
        String remoteFileName="./cms.json";  
        String locaFileName="C:/Users/zhangchengfu/Desktop/cms.json";  
        FtpClientUtil clientUtil=new FtpClientUtil();  
        clientUtil.upload(remoteFileName, locaFileName);  
    }
}
