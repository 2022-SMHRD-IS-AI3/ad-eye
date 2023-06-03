package com.sansam.adeye.service;

import com.sansam.adeye.domain.ContactDTO;

public interface IContactService {
	public void insert(ContactDTO cDto) throws Exception;
	public ContactDTO detail(Integer bno) throws Exception;
	public boolean modify(ContactDTO cDto) throws Exception;
	public boolean delete(Integer bno) throws Exception;
}
