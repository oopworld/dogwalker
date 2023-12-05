package com.dogwalker.util;//프로젝트에서 공통으로 사용되는 기능만 모아놓은 클래스

import java.io.File;

//파일업로드시 업로드할 경로지정 및 파일의 새이름을 부여(공통모듈)
public class FileUtil {

	//업로드 및 다운로드경로->정적상수
	public static final String UPLOAD_PATH="C:\\webtest\\4.jsp\\sts-3.9.18.RELEASE\\workspace\\Dogwalker_Team3\\src\\main\\webapp\\resources\\upload";
	
	//1.탐색기의 원본파일명만 받아서 처리해주는 메서드(ex test.txt)
	public static String rename(String filename)throws Exception{
		if(filename==null) return null;//업로드 X ->이름변경X
		//새이름 규칙=>시스템날짜+랜덤숫자(0~49)->조합
		String newName=Long.toString(System.currentTimeMillis())+(int)(Math.random()*50);
		System.out.println("newName(난수)=>"+newName);
		return rename(filename,newName);
	}
	
	//2.실제로 새로운 파일명을 변경하는 역할->확장자구분->변경된 이름만 구해서
    public static String rename(String filename,String newName)throws Exception{
		if(filename==null) return null;
		//확장자 구하기 (ex testdddddddddd.txt)
		int idx=filename.lastIndexOf(".");//못찾으면 -1을 리턴
		String extention="";//확장자 저장
		String newFileName="";//새파일명을 저장
		if(idx!=-1) {
			extention=filename.substring(idx);//idx이후부터 파일끝까지
			System.out.println("extention=>"+extention);
		}
		//새파일명
		int newIdx=newName.lastIndexOf(".");//확장자를 포함한 변경된 파일명
		if(newIdx!=-1) {
			newName=newName.substring(0,newIdx);//0은 포함 newIdx바로 앞까지
			System.out.println("newName(변경된파일명)=>"+newName);
		}
		newFileName=newName+extention.toLowerCase();//확장자(대)->소문자
		return newFileName;//실질적인 업로드된 파일명
	}
    
    //3.글수정->업로드된 파일도 수정->기존 업로드된 파일삭제->새로 업로드
    //파일삭제->수정목적
    public static void removeFile(String filename) {
    	File file=new File(UPLOAD_PATH,filename); //1.경로 2.파일명
    	if(file.exists()) file.delete();//이 경로에 파일이 존재한다면 삭제하라
    }
 //2 자유게시판
    
    
    //업로드 및 다운로드경로->정적상수(상대경로는 잘 안먹으니 절대경로로 지정할 
    	public static final String UPLOAD_PATH2="C:/webtest/4.jsp/workspace/Dogwalker_Team3/src/main/webapp/resources/upload2";
      
    //1.탐색기의 원본파일명만 받아서 처리해주는 메서드(ex test.txt)
  	public static String rename2(String filename2)throws Exception{
  		if(filename2==null) return null;//업로드 X ->이름변경X
  		//새이름 규칙=>시스템날짜+랜덤숫자(0~49)->조합
  		String newName=Long.toString(System.currentTimeMillis())+(int)(Math.random()*50);
  		System.out.println("newName(난수)=>"+newName);
  		return rename(filename2,newName);
  	}
  	
  	//2.실제로 새로운 파일명을 변경하는 역할->확장자구분->변경된 이름만 구해서
      public static String rename2(String filename2,String newName)throws Exception{
  		if(filename2==null) return null;
  		//확장자 구하기 (ex testdddddddddd.txt)
  		int idx=filename2.lastIndexOf(".");//못찾으면 -1을 리턴
  		String extention="";//확장자 저장
  		String newFileName="";//새파일명을 저장
  		if(idx!=-1) {
  			extention=filename2.substring(idx);//idx이후부터 파일끝까지
  			System.out.println("extention=>"+extention);
  		}
  		//새파일명
  		int newIdx=newName.lastIndexOf(".");//확장자를 포함한 변경된 파일명
  		if(newIdx!=-1) {
  			newName=newName.substring(0,newIdx);//0은 포함 newIdx바로 앞까지
  			System.out.println("newName(변경된파일명)=>"+newName);
  		}
  		newFileName=newName+extention.toLowerCase();//확장자(대)->소문자
  		return newFileName;//실질적인 업로드된 파일명
  	}
      
      //3.글수정->업로드된 파일도 수정->기존 업로드된 파일삭제->새로 업로드
      //파일삭제->수정목적
      public static void removeFile2(String filename2) {
        	File file=new File(UPLOAD_PATH2,filename2); //1.경로 2.파일명
        	if(file.exists()) file.delete();//이 경로에 파일이 존재한다면 삭제하라
        }
      
      
      
      
      //3 강아지자랑
  public static final String UPLOAD_PATH3="C:/webtest/4.jsp/workspace/Dogwalker_Team3/src/main/webapp/resources/upload3";
    	
//1.탐색기의 원본파일명만 받아서 처리해주는 메서드(ex test.txt)
	public static String rename3(String filename3)throws Exception{
		if(filename3==null) return null;//업로드 X ->이름변경X
		//새이름 규칙=>시스템날짜+랜덤숫자(0~49)->조합
		String newName=Long.toString(System.currentTimeMillis())+(int)(Math.random()*50);
		System.out.println("newName(난수)=>"+newName);
		return rename(filename3,newName);
	}
	
	//2.실제로 새로운 파일명을 변경하는 역할->확장자구분->변경된 이름만 구해서
    public static String rename3(String filename3,String newName)throws Exception{
		if(filename3==null) return null;
		//확장자 구하기 (ex testdddddddddd.txt)
		int idx=filename3.lastIndexOf(".");//못찾으면 -1을 리턴
		String extention="";//확장자 저장
		String newFileName="";//새파일명을 저장
		if(idx!=-1) {
			extention=filename3.substring(idx);//idx이후부터 파일끝까지
			System.out.println("extention=>"+extention);
		}
		//새파일명
		int newIdx=newName.lastIndexOf(".");//확장자를 포함한 변경된 파일명
		if(newIdx!=-1) {
			newName=newName.substring(0,newIdx);//0은 포함 newIdx바로 앞까지
			System.out.println("newName(변경된파일명)=>"+newName);
		}
		newFileName=newName+extention.toLowerCase();//확장자(대)->소문자
		return newFileName;//실질적인 업로드된 파일명
	}
    
    //3.글수정->업로드된 파일도 수정->기존 업로드된 파일삭제->새로 업로드
      public static void removeFile3(String filename3) {
      	File file=new File(UPLOAD_PATH3,filename3); //1.경로 2.파일명
      	if(file.exists()) file.delete();//이 경로에 파일이 존재한다면 삭제하라
      }
      
    
    
}
