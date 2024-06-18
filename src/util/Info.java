package util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;

import dao.CommDAO;


public class Info {
	public static String popheight = "alliframe.style.height=document.body.scrollHeight+";
	public static HashMap getUser(HttpServletRequest request)
	{
		HashMap map = (HashMap)(request.getSession().getAttribute("username")==null?request.getSession().getAttribute("user"):request.getSession().getAttribute("username"));
		return map;
	}
	public static String getselect(String name,String tablename,String zdname)
	{
		String select = "<select name=\""+name+"\" id=\""+name+"\" >";
		for(HashMap permap:new CommDAO().select("select * from "+tablename+" order by id desc")){
			select+="<option value=\""+permap.get(zdname)+"\">"+permap.get(zdname)+"</option>";
		}
		select+="</select>";
		return select;
	}
	public static String getselect(String name,String tablename,String zdname,String where)
	{

		String select = "<select name=\""+name+"\" id=\""+name+"\" >";
		select+="<option value=\"\">????</option>";
		for(HashMap permap:new CommDAO().select("select * from "+tablename+" where "+where+" order by id desc")){
			String optionstr = "";

			if(zdname.split(";").length==1){

				optionstr=permap.get(zdname.split("~")[0]).toString();


			}else{
				for(String str:zdname.split(";"))
				{
					String zdstr = str.split("~")[0];
					String zdnamestr = str.split("~")[1].equals("????")?"":(str.split("~")[1]+":");
					optionstr+=zdnamestr+permap.get(zdstr)+" - ";
				}
			}



			if(optionstr.indexOf(" - ")>-1)optionstr=optionstr.substring(0,optionstr.length()-3);
			select+="<option value=\""+optionstr+"\">"+optionstr+"</option>";
		}
		select+="</select>";
		return select;
	}
	public static String tform(HashMap map,String formname)
	{
		String jscode = "";
		try{
			jscode+="<script type=\"text/javascript\">\n";
			jscode+="function getPvalue()\n";
			jscode+="{\n";

			Set set = map.entrySet();
			Iterator it = set.iterator();
			while(it.hasNext())
			{
				String pm=((Object)it.next()).toString();
				String str1 = "";
				String str2 = "";
				String[] strs = pm.split("=");
				str1 = strs[0];
				if(strs.length==1)str2="";
				if(strs.length==2)str2=strs[1];
				str2 = str2.replaceAll("\r\n", "---");
				// str2 = str2.replaceAll("\"", "'");

				if(!str1.equals("content")){

					jscode+=" if(document.getElementsByName(\""+str1+"\").length>1)\n";
					jscode+=" {\n";
					jscode+=" var radios = document.getElementsByName(\""+str1+"\");\n";

					jscode+=" if(radios[0].type=='radio'){\n";
					jscode+=" for(var i=0;i<radios.length;i++)\n";
					jscode+=" {\n";
					jscode+=" if(radios[i].value==\""+str2+"\")\n";
					jscode+=" {\n";
					jscode+=" radios[i].checked=\"checked\";\n";
					jscode+=" }\n";
					jscode+=" }\n";
					jscode+=" }\n";


					jscode+=" if(radios[0].type=='checkbox'){\n";



					jscode+=" for(var i=0;i<radios.length;i++)\n";
					jscode+=" {\n";
					jscode+=" if(\""+str2+"\".indexOf(radios[i].value)>-1&&radios[i].id.indexOf('choosebox')==-1)\n";
					jscode+=" {\n";

					jscode+=" radios[i].checked=\"checked\";\n";


					if(str2.indexOf(" - ")>-1){
						for(String strch:str2.split(" ~ ")){

							String strchname = strch.substring(0,strch.lastIndexOf(" - "));
							jscode+=" if(document.getElementsByName('"+strchname+"').length>0)\n";
							jscode+=" {\n";
							jscode+=" document.getElementsByName('"+strchname+"')[0].value='"+strch.substring(strch.lastIndexOf(":")+1)+"';\n";
							jscode+=" }\n";


						}
					}


					jscode+=" }\n";
					jscode+=" }\n";
					jscode+=" }\n";

					jscode+=" if(radios.type=='select'){\n";
					jscode+=" "+formname+"."+str1+".value=\""+str2+"\";\n";
					jscode+=" }\n";


					jscode+=" }else{\n";
					jscode+=" if("+formname+"."+str1+")\n";
					jscode+="{\n";
					jscode+=""+formname+"."+str1+".value=\""+str2+"\";\n";
					jscode+="}\n";
					jscode+="}\n";


					jscode+="if(document.getElementById(\"txt\"))\n";
					jscode+="{\n";
					jscode+="document.getElementById(\"txt\").src=\"upfile/"+map.get("filename")+"\";\n";
					jscode+="}\n";

					jscode+="if(document.getElementById(\"txt2\"))\n";
					jscode+="{\n";
					jscode+="document.getElementById(\"txt2\").src=\"upfile/"+map.get("filename2")+"\";\n";
					jscode+="}\n";

					jscode+="if(document.getElementById(\"txt3\"))\n";
					jscode+="{\n";
					jscode+="document.getElementById(\"txt3\").src=\"upfile/"+map.get("filename3")+"\";\n";
					jscode+="}\n";

					jscode+="if(document.getElementById(\"txt4\"))\n";
					jscode+="{\n";
					jscode+="document.getElementById(\"txt4\").src=\"upfile/"+map.get("filename4")+"\";\n";
					jscode+="}\n";

					jscode+="if(document.getElementById(\"txt5\"))\n";
					jscode+="{\n";
					jscode+="document.getElementById(\"txt5\").src=\"upfile/"+map.get("filename5")+"\";\n";
					jscode+="}\n";

				}
			}

			jscode+="}\n";



			jscode+=" getPvalue();\n";
			jscode+="</script>\n";
		}catch (Exception e) {
			e.printStackTrace();
		}
		return jscode;
	}
	public static String generalFileName(String srcFileName) {
		try{
			int index=srcFileName.lastIndexOf(".");
			return StrUtil.generalSrid()+srcFileName.substring(index).toLowerCase();
		}catch(Exception e){
			return StrUtil.generalSrid();
		}
	}
	public synchronized static String getID() {

		Random random = new Random();
		StringBuffer ret = new StringBuffer(20);
		java.util.Date date = new java.util.Date();
		java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("MMddHHmmss", java.util.Locale.CHINA);
		ret.append(format.format(date));
		String rand = String.valueOf(Math.abs(random.nextInt()));
		//ret.append(getDateStr());
		ret.append(rand.substring(0,4));

		return ret.toString();
	}
	public synchronized static String ensubStr(Object source,int length) {
		String msource = Info.filterStrIgnoreCase(source.toString(), "<", ">");
		if(msource.length()>length)
		{
			msource=msource.substring(0,length)+"...";
		}
		return msource;
	}
	public static String getDateStr(){
		String dateString="";
		try{//yyyyMMddHHmmss
			java.text.SimpleDateFormat formatter=new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			java.util.Date currentTime_1=new java.util.Date();
			dateString=formatter.format(currentTime_1);
		}catch(Exception e){
		}
		return dateString;
	}
	public static String getGBKStr(String str) throws UnsupportedEncodingException{
		if(str==null){
			return "";
		}
		return  new String(str.getBytes("ISO-8859-1"),"GBK");
	}
	public static String getDay(String date,int day) {
		String b = date.substring(0,10);
		String c = b.substring(0,4);
		String d = b.substring(5,7);
		String f = b.substring(8,10);
		String aa = c+"/"+d+"/"+f;
		String a = "";
		DateFormat dateFormat =  DateFormat.getDateInstance(DateFormat.MEDIUM);
		GregorianCalendar grc=new GregorianCalendar();
		grc.setTime(new Date(aa));
		grc.add(GregorianCalendar.DAY_OF_MONTH,day);
		String resu = dateFormat.format(grc.getTime());
		String t[]= resu.split("-");
		String sesuu = "";
		for(int i=0;i<t.length;i++)
		{
			if(t[i].length()==1)
			{
				t[i]="0"+t[i];
			}
			sesuu += t[i]+"-";
		}

		return sesuu.substring(0,10);
	}
	public static int dayToday(String DATE1, String DATE2) {
		// 去除时间部分，只保留日期
		if(DATE1.contains(" ")) {
			DATE1 = DATE1.split(" ")[0];
		}
		if(DATE2.contains(" ")) {
			DATE2 = DATE2.split(" ")[0];
		}

		// 格式化日期字符串
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate date1 = LocalDate.parse(DATE1, formatter);
		LocalDate date2 = LocalDate.parse(DATE2, formatter);

		// 计算两个日期之间的天数差
		long daysBetween = ChronoUnit.DAYS.between(date1, date2);

		return (int) daysBetween;
	}
	public static String filterStrIgnoreCase(String source, String from, String to){
		String sourceLowcase=source.toLowerCase();
		String sub1,sub2,subLowcase1,subLowcase2;
		sub1=sub2=subLowcase1=subLowcase2="";
		int start=0,end;
		boolean done=true;
		if(source==null) return null;
		if(from==null||from.equals("")||to==null||to.equals(""))
			return source;
		while(done){
			start=sourceLowcase.indexOf(from,start);
			if(start==-1) {
				break;
			}
			subLowcase1=sourceLowcase.substring(0,start);
			sub1=source.substring(0,start);
			end=sourceLowcase.indexOf(to,start);
			if(end==-1){
				end=sourceLowcase.indexOf("/>",start);
				if(end==-1) {
					done=false;
				}
			}
			else{
				end=end+to.length();
				subLowcase2=sourceLowcase.substring(end,source.length());
				sub2=source.substring(end,source.length());
				sourceLowcase=subLowcase1+subLowcase2;
				source=sub1+sub2;
			}
			//System.out.println(start+" "+end);
		}
		return source;
	}
	public static void delPic(String path,String img)
	{
		if(img!=null)
		{
			if(!img.equals(""))
			{
				File file1=new File(path + "/" + img);
				if(file1.exists() ) {
					file1.deleteOnExit();
					file1.delete();
				}}}
	}
}

		

