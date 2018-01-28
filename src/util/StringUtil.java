package util;

import java.security.MessageDigest;

public class StringUtil {
	//s==null or s=''
	public static boolean isEmpty(String s)
	{
		boolean ret=false;
	
		if(s==null){
			ret=true;
		}
		else{
			if(s.length()==0)
				ret=true;
		}
			
		return ret;
		
	}
	
	public static String page(int page,int totalPage,String basePath){
		String index=(page==1)?"首页 ":"<a href= ' "+basePath+"QueryController.do?page=1&pagesize=4'>首页</a>";
		String last=(page==totalPage)?"尾页":"<a href='"+basePath+"QueryController.do?page="+totalPage+"&pagesize=4'>尾页</a>";
		int prevPage=(page>=1)?page-1:1;
		int nextPage=(page>=totalPage)?totalPage:page+1;
		String prev=(page==1)?"上一页":"<a href='"+basePath+"QueryController.do?page="+prevPage+"&pagesize=4'>上一页</a>";
		String next=(page==totalPage)?"下一页":"<a href='"+basePath+"QueryController.do?page="+nextPage+"&pagesize=4'>下一页</a>";
		String str="总共"+totalPage+"页/当前是第"+page+"页";
		String p="";
		String sep="&nbsp;";
		for(int i=1;i<=totalPage;i++){
			if(page==i){
				p+="["+i+"]";
			}else{
				p+="<a href='"+basePath+"QueryController.do?page="+i+"&pagesize=4'>["+i+"]</a>";
			}
		}
		String pageStr=str+sep+index+sep+prev+sep+p+sep+next+sep+last;
		return pageStr;
	}
	public static String MD5(String s){
		char hexDigits[]={'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'};       
        try {
            byte[] btInput = s.getBytes();
            // 获得MD5摘要算法的 MessageDigest 对象
            MessageDigest mdInst = MessageDigest.getInstance("MD5");
            // 使用指定的字节更新摘要
            mdInst.update(btInput);
            // 获得密文
            byte[] md = mdInst.digest();
            // 把密文转换成十六进制的字符串形式
            int j = md.length;
            char str[] = new char[j * 2];
            int k = 0;
            for (int i = 0; i < j; i++) {
                byte byte0 = md[i];
                str[k++] = hexDigits[byte0 >>> 4 & 0xf];
                str[k++] = hexDigits[byte0 & 0xf];
            }
            return new String(str);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

		
	}
	
	  public static void main(String[] args) {
	        System.out.println(StringUtil.MD5("111"));
	        System.out.println(StringUtil.MD5("222"));
	    }

	

}
