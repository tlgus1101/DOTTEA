package Dot_tea.shop.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.management.loading.MLet;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import Dot_tea.setting.CommandMap;
import Dot_tea.common.util.FileUtils;
import Dot_tea.shop.dao.Com_OrdersDAO;

@Service("com_ordersService")
public class Com_OrdersServiceImpl implements Com_OrdersService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "com_ordersDAO")
	private Com_OrdersDAO com_OrdersDAO;

	@Resource(name = "fileUtils")
	private FileUtils fileUtils;

	@Override
	public List<Map<String, Object>> orderBoardList(Map<String, Object> map) throws Exception {
		return com_OrdersDAO.orderBoardList(map);

	}

	@Override
	public Map<String, Object> orderBoardDetail(Map<String, Object> map, HttpServletRequest request) throws Exception {
		Map<String, Object> resultMap = com_OrdersDAO.orderBoardDetail(map);
		return resultMap;
	}

	@Override
	public Map<String, Object> orderBoardDetailC(Map<String, Object> map, HttpServletRequest request) throws Exception {
		Map<String, Object> resultMap = com_OrdersDAO.orderBoardDetailC(map);
		return resultMap;
	}

	// --------- 검색용 list 시작 ----------------

	@Override
	public List<Map<String, Object>> ordersBoardListSchName(Map<String, Object> map) throws Exception {
		return com_OrdersDAO.ordersBoardListSchName(map);
	}

	@Override
	public List<Map<String, Object>> ordersBoardListSchPhone(Map<String, Object> map) throws Exception {
		return com_OrdersDAO.ordersBoardListSchPhone(map);
	}

	@Override
	public List<Map<String, Object>> ordersBoardList2SchName(Map<String, Object> map) throws Exception {
		return com_OrdersDAO.ordersBoardList2SchName(map);
	}

	@Override
	public List<Map<String, Object>> ordersBoardList2SchPhone(Map<String, Object> map) throws Exception {
		return com_OrdersDAO.ordersBoardList2SchPhone(map);
	}

	@Override
	public List<Map<String, Object>> ordersBoardList3SchName(Map<String, Object> map) throws Exception {
		return com_OrdersDAO.ordersBoardList3SchName(map);
	}

	@Override
	public List<Map<String, Object>> ordersBoardList3SchPhone(Map<String, Object> map) throws Exception {
		return com_OrdersDAO.ordersBoardList3SchPhone(map);
	}

	// --------- 검색용 list 끝 ----------------

	@Override
	public void updateBoard(Map<String, Object> map) throws Exception {
		com_OrdersDAO.orderupdateBoard(map);

	}

	@Override
	public void orderinsert(Map<String, Object> map) throws Exception {
		com_OrdersDAO.orderinsertBoard(map);

	}

	@Override
	public void updateBoard2(Map<String, Object> map) throws Exception {
		com_OrdersDAO.orderupdateBoard2(map);

	}

	@Override
	public void updateBoard7(Map<String, Object> map) throws Exception {
		com_OrdersDAO.orderupdateBoard7(map);

	}

	@Override
	public void updateBoard8(Map<String, Object> map) throws Exception {
		com_OrdersDAO.orderupdateBoard8(map);

	}

	@Override
	public void updateBoard9(Map<String, Object> map) throws Exception {
		com_OrdersDAO.orderupdateBoard9(map);

	}

	@Override
	public List<Map<String, Object>> orderBoardList2(Map<String, Object> map) throws Exception {
		return com_OrdersDAO.orderBoardList2(map);
	}

	@Override
	public List<Map<String, Object>> orderBoardList3(Map<String, Object> map) throws Exception {
		return com_OrdersDAO.orderBoardList3(map);
	}

	@Override
	public List<Map<String, Object>> orderBoardList4(Map<String, Object> map) throws Exception {
		return com_OrdersDAO.orderBoardList4(map);
	}

	@Override
	public Map<String, Object> orderTotal(Map<String, Object> map) throws Exception {

		return com_OrdersDAO.orderTotal(map);
	}

	@Override
	public List<Map<String, Object>> MonthTotal(Map<String, Object> map) throws Exception {
		return com_OrdersDAO.MonthTotal(map);
	}

	@Override
	public List<Map<String, Object>> DayTotal(Map<String, Object> map) throws Exception {
		return com_OrdersDAO.DayTotal(map);
	}

}
