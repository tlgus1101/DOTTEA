package Dot_tea.order.service;

import java.util.List;
import java.util.Map;

import Dot_tea.setting.CommandMap;

public interface OrderService {
	List<Map<String, Object>> orderBoardList(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> orderPagingList(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> orderSearchList(Map<String, Object> map) throws Exception;

	Map<String, Object> orderBoardDetail(Map<String, Object> map) throws Exception;

	// List<Map<String, Object>> basketList(Map<String, Object> map) throws
	// Exception;

	List<Map<String, Object>> basketPagingList(Map<String, Object> map) throws Exception;

	void InBasket(Map<String, Object> map) throws Exception;

	Map<String, Object> SessionbasketDeal(Map<String, Object> map) throws Exception;

	void TeaBasketListDelete(Map<String, Object> map) throws Exception;

	Map<String, Object> selectOrders(Map<String, Object> map) throws Exception;

	void InsertOrders(Map<String, Object> map) throws Exception;

	void InsertOrders2(Map<String, Object> map) throws Exception;

	void BCountPlusMinus(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> orderDetailBuyList(Map<String, Object> map) throws Exception;

	void orderCancel(Map<String, Object> map) throws Exception;

	void orderReturn(Map<String, Object> map) throws Exception;

	void orderChange(Map<String, Object> map) throws Exception;

}
