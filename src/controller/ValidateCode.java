package controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ValidateCode extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ValidateCode() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	
	 public static final char[] CHARS = { '1', '2', '3', '4', '5', '6', '7',
         '8', '9', '0', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',
         'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W',
         'X', 'Y', 'Z', };
 public static Random random = new Random();

 public static String getRandomString() {
     StringBuffer buffer = new StringBuffer();
     for (int i = 0; i < 9; i++) {
         buffer.append(CHARS[random.nextInt(CHARS.length)]);
     }
     return buffer.toString();
 }

 public static Color getRandomColor() {
     return new Color(random.nextInt(255), random.nextInt(255), random
             .nextInt(255));
 }

 public static Color getReverseColor(Color c) {
     return new Color(255 - c.getRed(), 255 - c.getGreen(), 255 - c
             .getBlue());
 }

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		/*
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the GET method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
		*/
		
		
	     
	     //创建图片对象
	     int width = 60,height = 20 ;
	     BufferedImage image = new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB) ;
	     
	     Graphics g = image.getGraphics() ;
	     
	     //生成随机数
	     Random random = new Random() ;
	     String s = "" ;
	     for(int i=0;i<4;i++){
	    	 s += random.nextInt(10) ;
	     }
	     
	     System.out.println(s);
	     
	     //把随机数存到Session里面，便于等下比较
	     HttpSession session = request.getSession() ;
	     session.setAttribute("code",s) ;
	     
	     //随机生成颜色  Color color =  new Color(255,255,255) ;     random.nextInt(256)的值范围是0~255
	     Color color = new Color(random.nextInt(256),random.nextInt(256),random.nextInt(256)) ;
	     
	     //把随机数写到图片上
	     String a = null ;
	     Font font = new Font(a,Font.ITALIC,18) ;
	     g.setColor(color) ;
	     g.setFont(font);
	     g.drawString(s,10,height-5) ;
	     g.dispose() ;    //关闭画笔
	     
        //把图片送到客户端
	     //(4)向客户端响应图片字节流
	     //设置输出类型和浏览器不保存缓存
		 response.setContentType("image/jpeg") ;
	     response.setHeader("Cache-Control", "no-cache") ;
	     ServletOutputStream output = response.getOutputStream() ;
	     ImageIO.write(image,"JPEG",output) ;
	     output.flush();   //关闭输出流

	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the POST method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
