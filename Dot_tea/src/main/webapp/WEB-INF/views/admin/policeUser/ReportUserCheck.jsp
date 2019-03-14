<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
    <table class="board_view">
         <colgroup>
            <col width="20%"/>
            <col width="20%"/>
            <col width="20%"/>
            <col width="20%"/>
        </colgroup> 
        <caption>신고게시판 상세(후기)</caption>
        <tbody>
            <tr>
                <th scope="row">글 번호</th>
                <td>${map.P_USER_NO }</td>
                <th scope="row">신고<br>대상자</th>
                <td>${map.MEM_USER_USERID}</td>
                <input type="hidden" id="MEM_USER_NO" name="MEM_USER_NO" value="${map.MEM_USER_NO }">
       </tr>    
       
            
        </tbody>
    </table>
     
    <a href="#this" class="btn" id="Approval">승인</a>
    <a href="#this" class="btn" id="cancel">취소</a>
     
    <%@ include file="/WEB-INF/include/include-body.jspf" %>
    <script type="text/javascript">
        $(document).ready(function(){
            
            $("#Approval").on("click", function(e){ //승인
                e.preventDefault();
                fn_openApproval();
            });

            $("#cancel").on("click", function(e){ //취소
                e.preventDefault();
                fn_openCancel();
            });
        });
         
        function fn_openApproval(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/admin/UserUpdateApproval.tea' />");
            comSubmit.addParam("MEM_USER_NO", $("#MEM_USER_NO").val());
            comSubmit.submit();
        }
        
         
        function fn_openCancel(){
            var idx = "${map.P_USER_NO}";
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/admin/UserCancelStatus1.tea' />");
            comSubmit.addParam("P_USER_NO", idx );
            comSubmit.submit();
        }
    </script>
</body>
</html>
