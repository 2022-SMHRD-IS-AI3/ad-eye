package com.sansam.adeye.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sansam.adeye.domain.BoardAttachDTO;
import com.sansam.adeye.domain.BoardDTO;
import com.sansam.adeye.domain.Criteria;
import com.sansam.adeye.persistence.IBoardDAO;
import com.sansam.adeye.service.IBoardService;
import com.sansam.adeye.mapper.BoardAttachMapper;

@Service
public class BoardServiceImpl implements IBoardService {// 구현체

	@Autowired
	private IBoardDAO bDao;
	
	@Autowired
	private BoardAttachMapper attachMapper;
	
	@Transactional // 둘중에 하나가 잘못 되면 안된다고 
	@Override
	public void register(BoardDTO bDto) throws Exception {
		bDao.create(bDto);
		
		if (bDto.getAttachList() == null || bDto.getAttachList().size() <= 0) {
			return;
		}
		
		bDto.getAttachList().forEach(attach -> {
			attach.setBno(bDto.getBno());
			attachMapper.insert(attach);
		});
	}

	@Override
	public BoardDTO read(Integer bno) throws Exception {
		return bDao.read(bno);
	}

	
	@Override
	public boolean modify(BoardDTO bDto) throws Exception {
		attachMapper.deleteAll(bDto.getBno());
		
		boolean modifyResult = bDao.update(bDto) == 1;
		
		if (modifyResult && bDto.getAttachList().size() > 0) {
			bDto.getAttachList().forEach(attach -> {
				attach.setBno(bDto.getBno());
				attachMapper.insert(attach);
			});
		}
		return modifyResult;
	}

	@Transactional // 두 개의 기능을 하나로 묶어줘야한다.
	@Override
	public boolean remove(Integer bno) throws Exception {
		
		attachMapper.deleteAll(bno);
		return bDao.delete(bno) == 1;
	}

	@Override
	public List<BoardDTO> listAll(Criteria cri) throws Exception {
		return bDao.listAll(cri);
	}

	@Override
	public int getTotalCnt(Criteria cri) throws Exception {
		return bDao.getTotalCnt(cri);
	}

	@Override
	public List<BoardAttachDTO> getAttachList(int bno) {
		return attachMapper.findByBno(bno);
	}

}
