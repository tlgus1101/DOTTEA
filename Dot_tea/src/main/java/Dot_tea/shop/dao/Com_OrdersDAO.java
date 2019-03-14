package Dot_tea.shop.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import Dot_tea.member.dao.AbstractDAO;

@Repository("com_ordersDAO")
public class Com_OrdersDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> orderBoardList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("orders.ordersBoardList", map);

	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> orderBoardList2(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("orders.ordersBoardList2", map);

	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> orderBoardList3(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("orders.ordersBoardList3", map);

	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> orderBoardList4(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("orders.ordersBoardList4", map);

	}

	// ------------------------------ 검색용 list START---------------------------------------

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> ordersBoardListSchName(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("orders.ordersBoardListSchName", map);

	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> ordersBoardListSchPhone(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("orders.ordersBoardListSchPhone", map);

	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> ordersBoardList2SchName(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("orders.ordersBoardList2SchName", map);

	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> ordersBoardList2SchPhone(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("orders.ordersBoardList2SchPhone", map);

	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> ordersBoardList3SchName(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("orders.ordersBoardList3SchName", map);

	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> ordersBoardList3SchPhone(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("orders.ordersBoardList3SchPhone", map);

	}

	// ------------------------------ 검색용 list END
	// ---------------------------------------

	@SuppressWarnings("unchecked")
	public Map<String, Object> orderTotal(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("orders.ordersTotal", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> orderBoardDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("orders.ordersBoardDetail", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> orderBoardDetailC(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("orders.ordersBoardDetailC", map);
	}

	public void orderupdateBoard(Map<String, Object> map) throws Exception {
		update("orders.ordersStatus", map);
	}

	public void orderinsertBoard(Map<String, Object> map) throws Exception {
		insert("orders.ordersInsert", map);
	}

	public void orderupdateBoard2(Map<String, Object> map) throws Exception {

		update("orders.ordersStatus1", map);
	}

	public void orderupdateBoard7(Map<String, Object> map) throws Exception {

		update("orders.ordersStatus7", map);
	}

	public void orderupdateBoard8(Map<String, Object> map) throws Exception {

		update("orders.ordersStatus8", map);
	}

	public void orderupdateBoard9(Map<String, Object> map) throws Exception {

		update("orders.ordersStatus9", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> MonthTotal(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("orders.MonthTotal", map);

	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> DayTotal(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("orders.DayTotal", map);

	}

}
