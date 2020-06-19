package com.bd.notice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.bd.common.FileManager;
import com.bd.common.dao.CommonDAO;

@Service("notice.noticeService")
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public void insertNotice(Notice dto, String pathname) throws Exception {
		try {
			int seq = dao.selectOne("notice.seq");
			dto.setNum(seq);
			
			dao.insertData("notice.insertNotice", dto);
			
			// 파일 업로드
			if(! dto.getUpload().isEmpty()) {
				for(MultipartFile mf: dto.getUpload()) {
					String saveFilename = fileManager.doFileUpload(mf, pathname);
					if(saveFilename == null) continue;

						String originalFilename = mf.getOriginalFilename();
						long fileSize = mf.getSize();
								
						dto.setOriginalFilename(originalFilename);
						dto.setSaveFilename(saveFilename);
						dto.setFileSize(fileSize);
								
						insertFile(dto);
							}
						}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}	
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("notice.dataCount",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
		
	}

	@Override
	public List<Notice> listNotice(Map<String, Object> map) {
		List<Notice> list = null;
		try {
			list = dao.selectList("notice.listNotice",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Notice> listNoticeTop() {
	/*	List<Notice> list = null;
		try {
			list = dao.selectList("notice.listNoticeTop");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;*/
		return null;
	}

	@Override
	public void updateHitCount(int num) throws Exception {
	/*	try {
			dao.updateData("notice.updateHitCount", num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		*/
	}

	@Override
	public Notice readNotice(int num) {
/*		Notice dto = null;
		try {
			dto=dao.selectOne("notice.readNotice", num);
		} catch (Exception e) {
			e.printStackTrace();
		}*/
		return null;
	}

	@Override
	public Notice preReadNotice(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Notice nextReadNotice(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateNotice(Notice dto, String pathname) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteNotice(int num, String pathname) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertFile(Notice dto) throws Exception {
		try {
			dao.insertData("notice.insertFile", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<Notice> listFile(int num) {
		List<Notice> listFile=null;
		
	/*	try {
			listFile=dao.selectList("notice.listFile", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		*/
		return listFile;
	}

	@Override
	public Notice readFile(int fileNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteFile(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}
}