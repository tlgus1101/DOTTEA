package Dot_tea.member.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;

@Repository("memberDAO")
public class MemberDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectLoginCompany(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("login.com_Login_select", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMemberAdmin(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("login.admin_Login_select", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMemberUser(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("login.user_login_select", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectchk_Id(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("login.com_chk_id", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMemberCompany(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("company.com_mypage_select", map);
	}

	public void insertMemberCompany(Map<String, Object> map) throws Exception {
		insert("login.com_insert", map);
	}

	public void updateMemberCompany(Map<String, Object> map) throws Exception {
		update("company.com_mypage_update", map);
	}

	public void deleteMemberCompany(Map<String, Object> map) throws Exception {
		delete("company.com_delete", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectchk_man_email(Map<String, Object> map) throws Exception {
		// System.out.println(map.get("inputEmail"));
		return (Map<String, Object>) selectOne("login.com_chk_man_email", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectchk_com_email(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("login.com_chk_com_email", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectchk_blackcom_email(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("login.com_chk_blackcom_email", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectchk_blackMan_email(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("login.com_chk_blackMan_email", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectchk_user_Id(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("login.user_chk_id", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectchk_user_email(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("login.user_chk_email", map);
	}

	public void insertMemberUser(Map<String, Object> map) throws Exception {
		insert("login.user_insert", map);
		// insert("login.user_insert", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectLoginUser(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("login.user_login_select", map);
	}

	public void updateMemberUser(Map<String, Object> map) throws Exception {
		update("user.user_update", map);

	}

	public void deleteMemberUser(Map<String, Object> map) throws Exception {
		update("user.user_delete", map);

	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> find_user_id(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("login.find_user_id", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> find_com_id(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("login.find_com_id", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> find_user_pw(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("login.find_user_pw", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> find_com_pw(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("login.find_com_pw", map);
	}

	public void temp_com_pw(Map<String, Object> map) {
		System.out.println("keySet " + map.get("tempKey"));
		update("login.temp_com_pw", map);
	}

	public void unlikeCk(Map<String, Object> map) {
		update("user.unlikeCk", map);

	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> likeSelect(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("user.likeSelect", map);
	}

	public void likeCk(Map<String, Object> map) {
		update("user.likeCk", map);
	}

}