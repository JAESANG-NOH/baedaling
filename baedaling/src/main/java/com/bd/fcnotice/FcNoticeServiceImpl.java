package com.bd.fcnotice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.bd.common.FileManager;
import com.bd.common.dao.CommonDAO;

@Service("fcnotice.fcNoticeService")
public class FcNoticeServiceImpl implements FcNoticeService{

	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;
	
	
	@Override
	public void insertNotice(FcNotice dto, String pathname) throws Exception {
		try {
			int seq = dao.selectOne("fcnotice.seq");
			dto.setNum(seq);
			dao.insertData("fcnotice.insertNotice",dto);
			
			// 파일
			if(! dto.getUpload().isEmpty()) {
				for(MultipartFile mf : dto.getUpload()) {
					String saveFilename = fileManager.doFileUpload(mf, pathname);
					if(saveFilename == null) continue; 
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		
		return 0;
	}

	@Override
	public List<FcNotice> listNotice(Map<String, Object> map) {
		List<FcNotice> list = null;
		try {
			list = dao.selectList("fcnotice.listNotice", map);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	@Override
	public void updateHitCount(int num) throws Exception {
		
		
	}

	@Override
	public FcNotice readNotice(int num) {
		
		return null;
	}

	@Override
	public FcNotice preReadNotice(Map<String, Object> map) {
		
		return null;
	}

	@Override
	public FcNotice nextReadNotice(Map<String, Object> map) {
		
		return null;
	}

	@Override
	public void updateNotice(FcNotice dto, String pathname) throws Exception {
		
		
	}

	@Override
	public void deleteNotice(int num, String pathname) throws Exception {
		
		
	}

	@Override
	public void insertFile(FcNotice dto) throws Exception {
		
		
	}

	@Override
	public List<FcNotice> listFile(int num) {
		
		return null;
	}

	@Override
	public FcNotice readFile(int fileNum) {
		
		return null;
	}

	@Override
	public void deleteFile(Map<String, Object> map) throws Exception {
		
		
	}

	@Override
	public List<FcNotice> listImpotantNotice() {
		List<FcNotice> list = null;
		try {
			list = dao.selectList("fcnotice.listImportant");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
