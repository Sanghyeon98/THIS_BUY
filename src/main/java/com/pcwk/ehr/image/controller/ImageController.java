package com.pcwk.ehr.image.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.sql.SQLException;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.Gson;
import com.pcwk.ehr.cmn.MessageVO;
import com.pcwk.ehr.cmn.StringUtil;
import com.pcwk.ehr.image.domain.ImageVO;
import com.pcwk.ehr.image.service.ImageService;

import net.coobird.thumbnailator.Thumbnailator;

@Controller("imageController")
@RequestMapping("image")
public class ImageController {
	final Logger LOG = LogManager.getLogger(getClass());
	
	@Autowired
	ImageService imgService;
	
	final String FILE_PATH = "C:\\upload"; //일반 파일
	// 실제 서버상 파일 경로 : resources/upload/2022/12/202212120ce331f537b54c21a412138f9e3ca2d5.png
	final String IMG_PATH  = "C:\\Users\\ITSC\\git\\THIS_BUY\\src\\main\\webapp\\resources\\img"; //이미지 파일
	String IMG_VIEW_PATH = "/resources/img";
	String addYYYYMMPath = "";
	
	public ImageController() {}
	
	
	
	public void init() {
		// 1. 디렉터리 동적 생성 : yyyy 디렉터리, mm 디렉터리
		// ex) c:\\upload\\2022\\12
		
		String yyyyFolder = StringUtil.getCurrentDate("yyyy");
		String mmFolder = StringUtil.getCurrentDate("MM");
		
		LOG.debug("┌------------------------------------------┐");	
		LOG.debug("|  yyyyFolder : " + yyyyFolder);
		LOG.debug("|  mmFolder : " + mmFolder);
		LOG.debug("|  File.separator : " + File.separator);
		
		// \2022\12
		addYYYYMMPath =  File.separator + yyyyFolder + File.separator + mmFolder;
		LOG.debug("|  addYYYYMMPath : " + addYYYYMMPath);
		
		//IMG_VIEW_PATH = IMG_VIEW_PATH + "/" + yyyyFolder + "/" + mmFolder;
	
		//일반 파일
		File nomalFileDir = new File(FILE_PATH + addYYYYMMPath);
		if(nomalFileDir.isDirectory() == false) {	// 디렉터리가 아니면 (디렉터리가 없으면!)
			boolean isNormalMake =   nomalFileDir.mkdirs();
			LOG.debug("|  isNormalMake = " + isNormalMake);
			
		}
		
		//이미지파일
		File imageFileDir = new File(IMG_PATH + addYYYYMMPath);
		if(imageFileDir.isDirectory() == false) {
			boolean isImageMake = imageFileDir.mkdirs();
			LOG.debug("|  isImageMake = " + isImageMake);
		}
		
		LOG.debug("└------------------------------------------┘");	
	}
	
	
	/**
	 * 파일이 image인지 판단
	 * @param file
	 * @return true/false
	 */
	private boolean isImageFile(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());
			LOG.debug("|  contentType = " + contentType);
			return contentType.startsWith("image");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	
	@RequestMapping(value = "/doSave.do", method = RequestMethod.POST,
			produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String doSave(ImageVO inVO, Model model, MultipartHttpServletRequest mReg, HttpServletRequest req) throws SQLException, IOException {
		String jsonString = "";
		LOG.debug("┌-------------------------------------┐");
		
		if(null != inVO && inVO.getGubun() == 0) {
			inVO.setGubun(1);
		}
		
		init();
		
		int flag = 0;
		
		Iterator<String> fileNames = mReg.getFileNames();
		
		while(fileNames.hasNext()) {
			String upFileName = fileNames.next();	// upFileName : 화면에서 던지는 이름
			LOG.debug("|  fileName : " + upFileName);
			
			ImageVO saveVO = new ImageVO();
			
			// 이미지 구분 (1:제품, 2:게시글)
			saveVO.setGubun(inVO.getGubun());
			
			MultipartFile mf = mReg.getFile(upFileName);
			 
			LOG.debug("| mf : " + mf);
			LOG.debug("| mf.getOriginalFilename() : " + mf.getOriginalFilename());
			
			// 원본 파일명
			saveVO.setOrgName(mf.getOriginalFilename());
			
			
			// 등록된 파일이 없으면
			if(null == saveVO.getOrgName() || "".equals(saveVO.getOrgName())) {
				continue;
			}
			
			// 확장자
			String ext = "";
			if(saveVO.getOrgName().indexOf(".") > -1) {
				int idx = saveVO.getOrgName().lastIndexOf(".");
				ext = saveVO.getOrgName().substring(idx + 1);	// . 위치 다음부터 확장자만 추출
			}
			saveVO.setFileExt(ext);
			
			// 파일 사이즈
			saveVO.setFileSize(mf.getSize());
			
			// 저장 경로
			String savePath = "";
			if("png".equalsIgnoreCase(ext) || "jpg".equalsIgnoreCase(ext) ||
		       "jpeg".equalsIgnoreCase(ext) || "gif".equalsIgnoreCase(ext) ) {	// 이미지 파일
				
				String yyyyFolder = StringUtil.getCurrentDate("yyyy");
				String mmFolder = StringUtil.getCurrentDate("MM");
				
				String tomcatYearMonthFolder = IMG_VIEW_PATH + "/" + yyyyFolder + "/" + mmFolder;
				LOG.debug("|  tomcatYearMonthFolder = " + tomcatYearMonthFolder);
				
				// Tomcat 실제 경로
				String tomcatRealPath = req.getServletContext().getRealPath(tomcatYearMonthFolder);
				LOG.debug("|  tomcatRealPath = " + tomcatRealPath);

				// savePath = tomcatRealPath;
				savePath = this.IMG_PATH + addYYYYMMPath;
				
				saveVO.setViewPath(tomcatYearMonthFolder);
				LOG.debug("|  getImageViewPath = " + saveVO.getViewPath());
			} else {  // 이미지가 아닌 파일
				savePath = this.FILE_PATH + addYYYYMMPath;
			}
			saveVO.setSavePath(savePath);
			
			
			// 저장 파일명
			String saveFileName = StringUtil.getPK() + "." + ext;
			saveVO.setSaveName(saveFileName);
			LOG.debug("|  saveVO : " + saveVO);
			
			
			// 파일 객체 생성
			File saveFileObj = new File(saveVO.getSavePath(), saveVO.getSaveName());
			
			// 파일 전송(이동)
			mf.transferTo(saveFileObj);
			
			// 이미지 파일인지 판단 (s_저장파일명)
			if(isImageFile(saveFileObj)) {
				FileOutputStream thumbnail = new FileOutputStream(new File(saveVO.getSavePath(), "th_" + saveVO.getSaveName()));
				
				try {
					Thumbnailator.createThumbnail(mf.getInputStream(), thumbnail, 100, 100);
				} catch(IOException e) {
					LOG.debug(e.getMessage());
					throw e;
				}
			}
			
			// 이미지 저장
			flag = imgService.doSave(saveVO);
			
			String message = "";
			
			if(1 == flag) { // 추가 성공
				message = saveVO.getOrgName() + " 이 등록되었습니다.";
			} else { // 실패
				message = saveVO.getOrgName() + " 등록 실패!";
			}
			LOG.debug("|  flag : " + flag);
			
			// 이미지 id 가져오기
			ImageVO outVO = imgService.doSelectOne(saveVO);
			
			LOG.debug("|  이미지 outVO : " + outVO);
			
			jsonString = new Gson().toJson(outVO);
			
			LOG.debug("|  jsonString : " + jsonString);
			LOG.debug("└-------------------------------------┘");
		}
		
		return jsonString;
	}

}
