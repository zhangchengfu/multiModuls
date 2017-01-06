package com.laozhang.utils.ftp;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.ConnectException;

import org.apache.commons.net.PrintCommandListener;
import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;

public class FtpClientUtil {

	// ftp服务器地址
	private String server;

	// 端口
	private int port;

	// 用户名
	private String username;

	// 密码
	private String password;

	public FtpClientUtil() {
		server = "localhost";
		port = 21;
		username = "abc";
		password = "123456";
	}

	public FtpClientUtil(String server, int port, String username, String password) {
		this.server = server;
		this.port = port;
		this.username = username;
		this.password = password;
	}

	/**
	 * 上传文件
	 * 
	 * @param remoteFileName
	 *            远程文件名称
	 * @param locaFileName
	 *            本地文件名称
	 */
	public void upload(String remoteFileName, String locaFileName) {
		FTPClient ftp = null;
		try {
			ftp = new FTPClient();
			ftp.addProtocolCommandListener(new PrintCommandListener(new PrintWriter(System.out), true));
			// 连接ftp服务器
			connect(ftp);
			// 设置属性
			setProperty(ftp);
			// 上传文件
			upload(ftp, remoteFileName, locaFileName);
			// 退出
			logout(ftp);
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			if (ftp.isConnected()) {
				try {
					ftp.disconnect();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

	/**
	 * 下载文件
	 * 
	 * @param remoteFileName
	 *            远程文件名称
	 * @param locaFileName
	 *            本地文件名称
	 */
	public void download(String remoteFileName, String locaFileName) {
		FTPClient ftp = null;
		try {
			ftp = new FTPClient();
			ftp.addProtocolCommandListener(new PrintCommandListener(new PrintWriter(System.out), true));
			// 连接ftp服务器
			connect(ftp);
			// 设置属性
			setProperty(ftp);
			// 下载文件
			download( ftp, remoteFileName, locaFileName );
			// 退出
			logout(ftp);
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			if (ftp.isConnected()) {
				try {
					ftp.disconnect();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

	/**
	 * 创建文件夹
	 * 
	 * @param remotePathName
	 *            远程文件夹名称
	 */
	public void mkdir(String remotePathName) {
		FTPClient ftp = null;
		try {
			ftp = new FTPClient();
			ftp.addProtocolCommandListener(new PrintCommandListener(new PrintWriter(System.out), true));
			// 连接ftp服务器
			connect(ftp);
			// 设置属性
			setProperty(ftp);
			// 创建文件夹
			mkdir( ftp, remotePathName);
			// 退出
			logout(ftp);
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			if (ftp.isConnected()) {
				try {
					ftp.disconnect();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

	private void mkdir(FTPClient ftp, String remotePathName) throws Exception {
		ftp.makeDirectory(remotePathName);
	}

	private void download(FTPClient ftp, String remoteFileName, String locaFileName) throws Exception {
		OutputStream output=null;  
        output = new FileOutputStream(locaFileName);  
        ftp.retrieveFile(remoteFileName, output);   
        output.close();
	}

	private void setProperty(FTPClient ftp) throws Exception {
		ftp.enterLocalPassiveMode();
		//二进制传输,默认为ASCII
		ftp.setFileType(FTP.BINARY_FILE_TYPE);
	}

	private void logout(FTPClient ftp) throws Exception {
		ftp.noop();
        ftp.logout();
	}

	private void upload(FTPClient ftp, String remoteFileName, String locaFileName) throws Exception {
		//上传
		InputStream input; 
		input = new FileInputStream(locaFileName);
		ftp.storeFile(remoteFileName, input);
		input.close();
	}

	private void connect(FTPClient ftp) throws Exception {
		//连接服务器
		ftp.connect( server, port);
		int reply = ftp.getReplyCode();
		//是否连接成功 
		if ( !FTPReply.isPositiveCompletion( reply ) )         {  
            throw new ConnectException( server+" 服务器拒绝连接" );  
        }
		//登录
		if (!ftp.login(username, password)) {  
            throw new ConnectException( "用户名或密码错误" );  
       }
	}
}
