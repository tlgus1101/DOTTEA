package Dot_tea.setting;

import java.util.Comparator;
import java.util.Map;

public class ListSortMapDesc implements Comparator<Map<String, Object>> {

	private String key = null;

	public ListSortMapDesc(String key) {
		this.key = key;
	}

	@Override

	public int compare(Map<String, Object> a, Map<String, Object> b) {

		return b.get(key).toString().compareTo(a.get(key).toString());

	}

}
