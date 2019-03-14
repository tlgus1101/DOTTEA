package Dot_tea.member.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface MemberCompanyService {

	void insertMemberCompany(Map<String, Object> map) throws Exception;

	Map<String, Object> selectLoginCompany(Map<String, Object> map) throws Exception;

	Map<String, Object> selectMemberCompany(Map<String, Object> map) throws Exception;

	void updateMemberCompany(Map<String, Object> map, HttpServletRequest request) throws Exception;

	void deleteMemberCompany(Map<String, Object> map) throws Exception;

	Map<String, Object> selectMemberAdmin(Map<String, Object> map) throws Exception;

	Map<String, Object> selectMemberUser(Map<String, Object> map) throws Exception;

	Map<String, Object> select_check_id(Map<String, Object> map) throws Exception;

	Map<String, Object> select_check_man_email(Map<String, Object> map) throws Exception;

	Map<String, Object> select_check_com_email(Map<String, Object> map) throws Exception;

	Map<String, Object> com_chk_blackcom_email(Map<String, Object> map) throws Exception;

	Map<String, Object> com_chk_blackMan_email(Map<String, Object> map) throws Exception;

	Map<String, Object> find_com_id(Map<String, Object> map) throws Exception;

	Map<String, Object> find_com_pw(Map<String, Object> map) throws Exception;

	void temp_com_pw(Map<String, Object> map) throws Exception;
	
}