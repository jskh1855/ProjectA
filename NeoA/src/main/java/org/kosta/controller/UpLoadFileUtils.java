package org.kosta.controller;

import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import org.springframework.util.FileCopyUtils;

import net.coobird.thumbnailator.Thumbnails;

public class UpLoadFileUtils {
	//썸네일 이미지 크기
	static final int THUMB_WIDTH = 300;
	static final int THUMB_HEIGHT = 300;
    
	//파일 업로드
	public static String fileUpload(String uploadPath, String fileName, byte[] fileData, String ymdPath)
			throws Exception {
		System.out.println("uploadpath : "+uploadPath);
		System.out.println("filename : "+fileName);
		System.out.println("fileData : "+fileData);
		System.out.println("ymdPath : " + ymdPath);
		UUID uid = UUID.randomUUID();

		String newFileName = uid + "_" + fileName;
		String imgPath = uploadPath + ymdPath;

		File target = new File(imgPath, newFileName);
		FileCopyUtils.copy(fileData, target);

		String thumbFileName = "s_" + newFileName;
		File image = new File(imgPath + File.separator + newFileName);
		
		File thumbnail = new File(imgPath + File.separator + "s" + File.separator + thumbFileName);

		if (image.exists()) {
			thumbnail.getParentFile().mkdirs();
			Thumbnails.of(image).size(THUMB_WIDTH, THUMB_HEIGHT).toFile(thumbnail);
		}
		return newFileName;
	}
	//폴더이름 및 폴더 생성
	public static String calcPath(String uploadPath) {
		Calendar cal = Calendar.getInstance();
		String yearPath = File.separator + cal.get(Calendar.YEAR);
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));

		makeDir(uploadPath, yearPath, monthPath, datePath);
		makeDir(uploadPath, yearPath, monthPath, datePath + "\\s");

		return datePath;
	}
	//폴더 생성
	private static void makeDir(String uploadPath, String... paths) {

		if (new File(paths[paths.length - 1]).exists()) {
			return;
		}

		for (String path : paths) {
			File dirPath = new File(uploadPath + path);

			if (!dirPath.exists()) {
				dirPath.mkdir();
			}
		}
	}
}