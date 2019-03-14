package Dot_tea.member.service;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import Dot_tea.member.dao.MemberDAO;

@Service("memberCompanyService")
public class MemberCompanyServiceImpl implements MemberCompanyService {

	@Resource(name = "memberDAO")
	private MemberDAO memberDAO;

	@Override
	public void insertMemberCompany(Map<String, Object> map) throws Exception {
		memberDAO.insertMemberCompany(map);
	}

	@Override
	public Map<String, Object> selectMemberCompany(Map<String, Object> map) throws Exception {

		return memberDAO.selectMemberCompany(map);
	}

	@Override
	public Map<String, Object> selectLoginCompany(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.selectLoginCompany(map);
	}

	@Override
	public void updateMemberCompany(Map<String, Object> map, HttpServletRequest request) throws Exception {
		memberDAO.updateMemberCompany(map);

	}

	@Override
	public void deleteMemberCompany(Map<String, Object> map) throws Exception {
		memberDAO.deleteMemberCompany(map);
	}

	@Override
	public Map<String, Object> selectMemberAdmin(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.selectMemberAdmin(map);
	}

	@Override
	public Map<String, Object> selectMemberUser(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.selectMemberUser(map);
	}

	@Override
	public Map<String, Object> select_check_id(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.selectchk_Id(map);
	}

	@Override
	public Map<String, Object> select_check_man_email(Map<String, Object> map) throws Exception {
		return memberDAO.selectchk_man_email(map);
	}

	@Override
	public Map<String, Object> select_check_com_email(Map<String, Object> map) throws Exception {
		return memberDAO.selectchk_com_email(map);
	}

	@Override
	public Map<String, Object> com_chk_blackcom_email(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.selectchk_blackcom_email(map);
	}

	@Override
	public Map<String, Object> com_chk_blackMan_email(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.selectchk_blackMan_email(map);
	}

	@Override
	public Map<String, Object> find_com_id(Map<String, Object> map) throws Exception {
		return memberDAO.find_com_id(map);
	}

	@Override
	public Map<String, Object> find_com_pw(Map<String, Object> map) throws Exception {
		return memberDAO.find_com_pw(map);
	}

	@Override
	public void temp_com_pw(Map<String, Object> map) throws Exception {
		System.out.println("임시비번 가나?? " + map);
		memberDAO.temp_com_pw(map);
	}
}
