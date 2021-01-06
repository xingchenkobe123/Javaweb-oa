package cn.sjzc.edu.utils;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DownServlet extends HttpServlet {
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1������ǰ̨������. ��ȡҪ���ص��ļ���Readme.txt
		String fileName = request.getParameter("filename");
		
		//2. ��ȡReadme.txt��tomcat����ľ���·��
		String path = getServletContext().getRealPath("file/"+fileName);
		
		//3,������Ӧͷ����ʾ�û����Զ�������
		response.setHeader("Content-Disposition", "attachment; filename="+fileName);
		
		//4. ת����������
		InputStream is = new FileInputStream(path);
		OutputStream os = response.getOutputStream();
		
		int len = 0 ;
		byte[]buffer = new byte[1024];
		while( (len = is.read(buffer)) != -1){
			os.write(buffer, 0, len);
		}
		
		os.close();
		is.close();
	
	}

	
}
