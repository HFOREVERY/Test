<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.util.*, org.apache.commons.fileupload.*, java.util.*,java.io.*" %>
<%@ page import="com.fh.util.DesFileEncrypt" %>
<%@ page import="org.apache.commons.fileupload.disk.*, org.apache.commons.fileupload.servlet.*" %>
<%!
	
	public void upload(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String savePath = this.getServletConfig().getServletContext().getRealPath("");
		savePath = savePath + request.getParameter("uploadPath");
		File f1 = new File(savePath);
		//这里接收了uploadPath的值  System.out.println(request.getParameter("uploadPath"));
		if (!f1.exists()) {
			f1.mkdirs();
		}
		DiskFileItemFactory fac = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(fac);
		upload.setHeaderEncoding("utf-8");
		List fileList = null;
		try {
			fileList = upload.parseRequest(request);
		} catch (FileUploadException ex) {
			return;
		}
		
		
		String fileNmae = request.getParameter("fileNmae"); 
		Iterator<FileItem> it = fileList.iterator();
		String name = "";
		String extName = "";
		while (it.hasNext()) {
			FileItem item = it.next();
			if (!item.isFormField()) {
				name = item.getName();
				long size = item.getSize();
				String type = item.getContentType();
				//System.out.println(size + " " + type);
				if (name == null || name.trim().equals("")) {
					continue;
				}
	
				// 扩展名格式：
				if (name.lastIndexOf(".") >= 0) {
					extName = name.substring(name.lastIndexOf("."));
				}
	
				File file = null;
				if(null != fileNmae && !"".equals(fileNmae)){
					file = new File(savePath + fileNmae);
				}else{
					do {
						name = new java.text.SimpleDateFormat("yyyyMMddhhmmss").format(new Date());	//获取当前日期
						name = name + (int)(Math.random()*90000+10000);
						file = new File(savePath + name+"-enc" + extName);
					} while (file.exists());
				}
				//File saveFile = new File(savePath + name + extName);
				try {
					item.write(file);
					DesFileEncrypt a = new DesFileEncrypt();
					a.encrypt(savePath + name+"-enc" + extName, savePath + name + extName);
					if(file.exists()&&file.isFile()){
			             file.delete();
			        }
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		if(null != fileNmae && !"".equals(fileNmae)){
			response.getWriter().print(fileNmae);
		}else{
			response.getWriter().print((name.trim() + extName.trim()).trim());
		}
	}
	
	
%>
<%
	upload(request, response);
%>