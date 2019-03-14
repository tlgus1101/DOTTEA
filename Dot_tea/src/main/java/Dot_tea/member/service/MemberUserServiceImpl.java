package Dot_tea.member.service;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import Dot_tea.member.dao.MemberDAO;

@Service("memberUserService")
public class MemberUserServiceImpl implements MemberUserService {

   @Resource(name = "memberDAO")
   private MemberDAO memberDAO;

   @Override
   public void insertMemberUser(Map<String, Object> map) throws Exception {
      memberDAO.insertMemberUser(map);
   }

   @Override
   public Map<String, Object> selectMemberUser(Map<String, Object> map) throws Exception {

      return memberDAO.selectMemberUser(map);
   }

   @Override
   public Map<String, Object> selectLoginUser(Map<String, Object> map) throws Exception {
      // TODO Auto-generated method stub
      return memberDAO.selectLoginUser(map);
   }

   @Override
   public void updateMemberUser(Map<String, Object> map, HttpServletRequest request) throws Exception {
      memberDAO.updateMemberUser(map);

   }

   @Override
   public void deleteMemberUser(Map<String, Object> map) throws Exception {
      memberDAO.deleteMemberUser(map);
   }

   @Override
   public Map<String, Object> select_check_id(Map<String, Object> map) throws Exception {
      return memberDAO.selectchk_user_Id(map);
   }

   @Override
   public Map<String, Object> select_check_email(Map<String, Object> map) throws Exception {
      return memberDAO.selectchk_user_email(map);
   }

   @Override
   public Map<String, Object> find_user_id(Map<String, Object> map) throws Exception {
      return memberDAO.find_user_id(map);
   }

   @Override
   public Map<String, Object> find_user_pw(Map<String, Object> map) throws Exception {
      return memberDAO.find_user_pw(map);
   }

   @Override
   public void unlikeCk(Map<String, Object> map) throws Exception {
      Map<String, Object> list = memberDAO.likeSelect(map);
      if (list != null) {
         String like = (String) list.get("MEM_LIKE_DEAL");
         String[] likeList = like.split(" ");

         String temp = "";

         for (int i = 0; i < likeList.length; i++) {
            if (likeList[i].equals(map.get("DEAL_NO"))) {
            } else {
               temp += likeList[i] + " ";
            }
         }

         map.put("MEM_LIKE_DEAL", temp);
      }
      memberDAO.unlikeCk(map);

   }

   @Override
   public void likeCK(Map<String, Object> map) throws Exception {
      Map<String, Object> list = memberDAO.likeSelect(map);
      String like = "";
      if (list != null)
         like = (String) list.get("MEM_LIKE_DEAL");

      map.put("MEM_LIKE_DEAL", map.get("DEAL_NO") + " " + like);
      memberDAO.likeCk(map);
   }

   @Override
   public Map<String, Object> likeSelect(Map<String, Object> map) throws Exception {
      return memberDAO.likeSelect(map);
   }
}