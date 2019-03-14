package Dot_tea.order.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import Dot_tea.member.dao.AbstractDAO;

@Repository("orderDAO")
public class OrderDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> orderBoardList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("UserShop.MyOrderList", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> orderPagingList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectPagingList("UserShop.orderBoardList", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> orderSearchList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectPagingList("UserShop.orderSearchList", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> orderBoardDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("UserShop.orderBoardDetail", map);
	}

	public void InBasket(Map<String, Object> map) throws Exception {
		insert("UserShop.basket", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> basketPagingList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("UserShop.basketList", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> SessionbasketDeal(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("UserShop.SessionbasketDeal", map);
	}

	public void TeaBasketListDelete(Map<String, Object> map) throws Exception {
		delete("UserShop.TeaBasketListDelete", map);
	}

	public Map<String, Object> selectOrders(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("UserShop.selectOrders", map);
	}

	public void InsertOrders(Map<String, Object> map) {
		insert("UserShop.InsertOrders", map);
	}

	public void InsertOrders2(Map<String, Object> map) {
		insert("UserShop.InsertOrders2", map);
	}

	public void BCountPlusMinus(Map<String, Object> map) {
		update("UserShop.BCountPlusMinus", map);

	}

	public List<Map<String, Object>> orderDetailBuyList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>) selectList("UserShop.orderDetailBuyList", map);
	}

	public void orderCancel(Map<String, Object> map) throws Exception {
		update("UserShop.orderUpdate", map);
	}

	public void orderReturn(Map<String, Object> map) throws Exception {
		update("UserShop.orderUpdate2", map);
	}

	public void orderChange(Map<String, Object> map) throws Exception {
		update("UserShop.orderUpdate3", map);
	}

}
