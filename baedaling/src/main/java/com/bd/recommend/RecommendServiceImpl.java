package com.bd.recommend;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.bd.common.FileManager;
import com.bd.common.dao.CommonDAO;

@Service("recommend.recommendService")
public class RecommendServiceImpl implements RecommendService{
	@Autowired
	private FileManager fileManager;
	@Autowired
	private CommonDAO dao;
	@Override
	public void writeRecommend(Recommend dto, String pathname) throws Exception {
		try {
			int seq = dao.selectOne("rc.seq");
			dto.setNum(seq);
			dao.insertData("rc.insertRecommend",dto);
			if(! dto.getUpload().isEmpty()) {
				for(MultipartFile mf:dto.getUpload()) {
					String saveFilename=fileManager.doFileUpload(mf, pathname);
					if(saveFilename==null) continue;

					String originalFilename=mf.getOriginalFilename();
					long fileSize=mf.getSize();
					
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
	public void insertFile(Recommend dto) throws Exception {
		try {
			dao.insertData("rc.insertFile", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	@Override
	public List<Recommend> listRecommend(Map<String, Object> map) {
		List<Recommend> list = null;
		try {
			list = dao.selectList("rc.listRecommend", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("rc.dataCount",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	@Override
	public Recommend readPage(int num) {
		Recommend dto = null;
		try {
			dto = dao.selectOne("rc.readpage", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	@Override
	public void updateHitCount(int num) throws Exception {
		try {
			dao.updateData("rc.updateHitCount",num);
		} catch (Exception e) {
			throw e;
		}
		
	}
	@Override
	public Recommend preReadRecommend(Map<String, Object> map) {
		Recommend dto = null;
		try {
			dto = dao.selectOne("rc.preReadRecommend", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	@Override
	public Recommend nextReadRecommend(Map<String, Object> map) {
		Recommend dto = null;
		try {
			dto = dao.selectOne("rc.nextReadRecommend", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	@Override
	public void updateRecommend(Recommend dto, String pathname) throws Exception {
		
		
	}
	@Override
	public void deleteRecommend(int num, String pathname, String userId) throws Exception {
		
		
	}

	@Override
	public List<Recommend> listFile(int num) {
		List<Recommend> list = null;
		try {
			list = dao.selectList("rc.listFile", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Recommend readFile(int fileNum) {
		Recommend dto = null;
		try {
			dto = dao.selectOne("rc.readFile",fileNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void deleteFile(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	
}
