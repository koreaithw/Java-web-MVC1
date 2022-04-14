package util;

import java.io.*;

public class FileUtil {
	//실제사진을 디렉토리공간에 넣어주는 역할
	public  static void saveImage(String root, String fname, byte[] data) 
	throws IOException{
		root += "/images"; //사진을 저장할 디렉토리
									
		File f = new File(root); //file root 가 있는지 확인
		if(!f.exists()) f.mkdir(); //없으면 만들어라
		
		f = new File(root+"/"+fname);
		
		FileOutputStream out = new FileOutputStream(f);
		out.write(data);
		out.close();
	}
}
