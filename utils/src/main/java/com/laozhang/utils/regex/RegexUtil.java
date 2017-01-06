package com.laozhang.utils.regex;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

//正则表达式工具类
public class RegexUtil {
	
	private CharSequence res;
    private String pattern;
    private Pattern p;
    private Matcher m;
    private int size = 0;
    private String[] list;//所有匹配到的字符串
	
	private static RegexUtil reg;
	private RegexUtil(CharSequence res,String pattern) {
		this.res = res;
        this.pattern = pattern;
        p = Pattern.compile(pattern);
        m = p.matcher(res);
        while(m.find()){
            size++;
        }
        list = new String[size];
        m.reset();
        for (int i = 0; i < size; i++) {
            if(m.find())list[i] = m.group();
        }
	}
	public static RegexUtil init(CharSequence res,String pattern) {
		if (reg==null||(!res.equals(reg.res)||!pattern.equals(reg.pattern))) {
			//在没有实例或内容不同的时候新建一个实例
			reg = new RegexUtil(res, pattern);
		}
		return reg;
	}
	
	/**是否能匹配到至少一个*/
    public boolean find(){
        return size>0;
    }
    
    /**匹配整个字符串，必须整个字符串满足正则表达式才算true*/
    public boolean match(){
        return find()&&get(0).equals(res);
    }
    
    /**获取所有匹配的字符串个数*/
    public int size(){
        return size;
    }
    
    /**获取所有匹配到的字符串*/
    public String[] getAll(){
        return list;
    }
    
    /**获取匹配到的第N个字符串*/
    public String get(int index){
        if (index<0) {
            System.out.println("请不要开玩笑");
            return null;
        }
        if (index>=size) {
            System.out.println("并没有匹配到辣么多");
            return null;
        }
        return list[index];
    }
    
    /**替换所有匹配到的字符串*/
    public String replaceAll(String replacement){
        return m.replaceAll(replacement);
    }
    
    /**替换第一个匹配到的字符串*/
    public String replaceFirst(String replacement){
        return m.replaceFirst(replacement);
    }
    
    /**替换最后一个匹配到的字符串*/
    public String replaceTail(String replacement){
        return replace(size-1, replacement);
    }
    
    /**替换第N个匹配到的字符串*/
    public String replace(int index,String replacement){
        m.reset();
        boolean isFind = false;
        while(index>=0){
            isFind = m.find();
            index--;
        }
        if(isFind){
            StringBuffer sb = new StringBuffer();
            m.appendReplacement(sb, replacement);
            m.appendTail(sb);
            return sb.toString();
        }
        return (String) res;
    }
    
    public static void main(String[] args) {
    	String res = "abc adc aac acc abbc";
        String pattern = "a\\wc";
        //String pattern = "awc";
        //简单用法的示范
        int size = RegexUtil.init(res, pattern).size();
        boolean find = RegexUtil.init(res, pattern).find();
        System.out.println("find-->"+find);
        System.out.println("size-->"+size);
        //获取匹配到的字符串
        System.out.println("------下面是get相关------");
        RegexUtil zz = RegexUtil.init(res, pattern);
        System.out.println("all-->"+zz.get(-1));
        System.out.println("all-->"+zz.get(0));
        System.out.println("all-->"+zz.get(1));
        System.out.println("all-->"+zz.get(2));
        System.out.println("all-->"+zz.get(3));
        System.out.println("all-->"+zz.get(4));
        //替换字符串
        System.out.println("------下面是replace相关------");
        String replacement = "诶嘿嘿";
        System.out.println("替换所有："+zz.replaceAll(replacement));
        System.out.println("替换第一个："+zz.replaceFirst(replacement));
        System.out.println("替换最后一个："+zz.replaceTail(replacement));
        System.out.println("替换第2个："+zz.replace(1, replacement));
        System.out.println("替换第3个："+zz.replace(2, replacement));
        System.out.println("替换第10个（并没有10个）："+zz.replace(9, replacement));
        //实用功能
        System.out.println("------下面是匹配整个字符串------");
        String p = "1\\d{10}";//验证手机号
        String e = ".+@\\w+.com";//验证邮箱
        System.out.println("验证手机号18202020202："+RegexUtil.init("18202020202", p).match());
        System.out.println("验证手机号1320202020："+RegexUtil.init("1820202020", p).match());
        System.out.println("验证手机号20202020202："+RegexUtil.init("20202020202", p).match());
        System.out.println("验证邮箱3164@qq.com："+RegexUtil.init("3164@qq.com", e).match());
        System.out.println("验证邮箱www.3164@163.com："+RegexUtil.init("www.3164@163.com", e).match());
        System.out.println("验证邮箱www.baidu.com："+RegexUtil.init("www.baidu.com", e).match());
        System.out.println("------------验证正整数--------------");
        System.out.println("验证123"+RegexUtil.init("123", "^[1-9]\\d*$").match());
        System.out.println("验证-123"+RegexUtil.init("-123", "^[1-9]\\d*$").match());
	}
}

/*常用正则表达式
 * var regexEnum =   

{  
  
 intege:"^-?[1-9]\\d*$",     //整数  
  
 intege1:"^[1-9]\\d*$",     //正整数  
  
 intege2:"^-[1-9]\\d*$",     //负整数  
  
 num:"^([+-]?)\\d*\\.?\\d+$",   //数字  
  
 num1:"^[1-9]\\d*|0$",     //正数（正整数 + 0）  
  
 num2:"^-[1-9]\\d*|0$",     //负数（负整数 + 0）  
  
 decmal:"^([+-]?)\\d*\\.\\d+$",   //浮点数  
  
 decmal1:"^[1-9]\\d*.\\d*|0.\\d*[1-9]\\d*$",//正浮点数  
  
 decmal2:"^-([1-9]\\d*.\\d*|0.\\d*[1-9]\\d*)$",//负浮点数  
  
 decmal3:"^-?([1-9]\\d*.\\d*|0.\\d*[1-9]\\d*|0?.0+|0)$", //浮点数  
  
 decmal4:"^[1-9]\\d*.\\d*|0.\\d*[1-9]\\d*|0?.0+|0$",//非负浮点数（正浮点数 + 0）  
  
 decmal5:"^(-([1-9]\\d*.\\d*|0.\\d*[1-9]\\d*))|0?.0+|0$",//非正浮点数（负浮点数 + 0）  
  
 email:"^\\w+((-\\w+)|(  
\\.\\w+))*\\@[A-Za-z0-9]+((\\.|-)[A-Za-z0-9]+)*\\.[A-Za-z0-9]+$  
", //邮件  
  
 color:"^[a-fA-F0-9]{6}$",    //颜色  
  
   
url:"^http[s]?:\\/\\/([\\w-]+\\.)+[\\w-]+([\\w-./?%&=]*)?$  
", //url  
  
 chinese:"^[\\u4E00-\\u9FA5\\uF900-\\uFA2D]+$",     //仅中文  
  
 ascii:"^[\\x00-\\xFF]+$",    //仅ACSII字符  
  
 zipcode:"^\\d{6}$",      //邮编  
  
 mobile:"^(13[0-9]{9}|15[012356789][0-9]{8}|18[0256789][0-9]{8}|147[0-9]{8}$)",    //手机  
  
 ip4:"^(25[0-5]|2[0-4]\\d|[0-1]\\d{2}|[1-9]?\\d)\\.(25[0-5]|2[0-4]\\d|[0-1]\\d{2}|[1-9]?\\d)\\.(25[0-5]|2[0-4]\\d|[0-1]\\d{2}|[1-9]?\\d)\\.(25[0-5]|2[0-4]\\d|[0-1]\\d{2}|[1-9]?\\d)$", //ip地址  
  
 notempty:"^\\S+$",      //非空  
  
 picture:"(.*)\\.(jpg|bmp|gif|ico|pcx|jpeg|tif|png|raw|tga)$", //图片  
  
 rar:"(.*)\\.(rar|zip|7zip|tgz)$",        //压缩文件  
  
 date:"^\\d{4}(  
\\-|\\/|\.)\\d{1,2}\\1\\d{1,2}$  
",     //日期  
  
 qq:"^[1-9]*[1-9][0-9]*$",    //QQ号码  
  
 tel:"^(([0\\+]\\d{2,3}-)?(0\\d{2,3})-)?(  
\\d{7,8})(-(\\d{3,}))?$  
", //电话号码的函数(包括验证国内区号,国际区号,分机号)  
  
 username:"^\\w+$",      //用来用户注册。匹配由数字、26个英文字母或者下划线组成的字符串  
  
 letter:"^[A-Za-z]+$",     //字母  
  
 letter_u:"^[A-Z]+$",     //大写字母  
  
 letter_l:"^[a-z]+$",     //小写字母  
  
 idcard:"^[1-9]([0-9]{14}|[0-9]{17})$" //身份证  
  
}*/
