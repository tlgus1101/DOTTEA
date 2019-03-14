package Dot_tea.member.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface MemberUserService {

   void insertMemberUser(Map<String, Object> map) throws Exception;

   Map<String, Object> selectLoginUser(Map<String, Object> map) throws Exception;

   Map<String, Object> selectMemberUser(Map<String, Object> map) throws Exception;

   void updateMemberUser(Map<String, Object> map, HttpServletRequest request) throws Exception;

   void deleteMemberUser(Map<String, Object> map) throws Exception;

   Map<String, Object> select_check_id(Map<String, Object> map) throws Exception;

   Map<String, Object> select_check_email(Map<String, Object> map) throws Exception;

   Map<String, Object> find_user_id(Map<String, Object> map) throws Exception;

   Map<String, Object> find_user_pw(Map<String, Object> map) throws Exception;

   void unlikeCk(Map<String, Object> map) throws Exception;

   void likeCK(Map<String, Object> map) throws Exception;

   Map<String, Object> likeSelect(Map<String, Object> map) throws Exception;

}