package Dot_tea.order.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import Dot_tea.order.dao.OrderDAO;
import Dot_tea.setting.CommandMap;

@Service("orderService")
public class OrderServiceImpl implements OrderService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "orderDAO")
	private OrderDAO orderDAO;

	@Override
	public List<Map<String, Object>> orderBoardList(Map<String, Object> map) throws Exception {
		return orderDAO.orderBoardList(map);
	}

	@Override
	public List<Map<String, Object>> orderPagingList(Map<String, Object> map) throws Exception {
		return orderDAO.orderPagingList(map);
	}

	@Override
	public List<Map<String, Object>> orderSearchList(Map<String, Object> map) throws Exception {
		return orderDAO.orderSearchList(map);
	}

	@Override
	public Map<String, Object> orderBoardDetail(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = orderDAO.orderBoardDetail(map);
		return resultMap;
	}

	@Override
	public void InBasket(Map<String, Object> map) throws Exception {
		orderDAO.InBasket(map);
	}

	@Override
	public List<Map<String, Object>> basketPagingList(Map<String, Object> map) throws Exception {
		return orderDAO.basketPagingList(map);
	}

	@Override
	public Map<String, Object> SessionbasketDeal(Map<String, Object> map) throws Exception {
		return orderDAO.SessionbasketDeal(map);
	}

	@Override
	public void TeaBasketListDelete(Map<String, Object> map) throws Exception {
		orderDAO.TeaBasketListDelete(map);
	}

	@Override
	public Map<String, Object> selectOrders(Map<String, Object> map) throws Exception {
		return orderDAO.selectOrders(map);
	}

	@Override
	public void InsertOrders(Map<String, Object> map) throws Exception {
		orderDAO.InsertOrders(map);
	}

	@Override
	public void InsertOrders2(Map<String, Object> map) throws Exception {
		orderDAO.InsertOrders2(map);

	}

	@Override
	public void BCountPlusMinus(Map<String, Object> map) {
		orderDAO.BCountPlusMinus(map);
	}

	@Override
	public List<Map<String, Object>> orderDetailBuyList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return orderDAO.orderDetailBuyList(map);
	}

	@Override
	public void orderCancel(Map<String, Object> map) throws Exception {
		orderDAO.orderCancel(map);

	}

	@Override
	public void orderReturn(Map<String, Object> map) throws Exception {
		orderDAO.orderReturn(map);

	}

	@Override
	public void orderChange(Map<String, Object> map) throws Exception {
		orderDAO.orderChange(map);

	}
}
