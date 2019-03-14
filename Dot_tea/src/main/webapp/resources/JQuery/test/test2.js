// 다른 라이브러리와의 충돌을 피하기 위해 즉시실행 함수에 플러그인을 정의한다.
(function($) {

	// barMenu 플러그인 정의
	$.fn.barMenu = function() {
		this.each(function(index) {
			var barMenu = new BarMenu(this);

			// setSelectMenuItemAt() 메서드를 사용하기 위해
			// barMenu() 플러그인 내부에서 생성한 barMenu 객체를
			// jQuery 객체에 저장해 둔다.
			$(this).data('barMenu', barMenu);
		});
		return this;
	};

	// 외부에서 n번째 인덱스에 해당하는 메뉴아이템을 선택할 수 있는 기능을 플러그인으로 정의
	// barMenu 미리 선택 처리하기 위한 플러그인
	$.fn.selectBarMenuAt = function(selectedIndex, animation) {
		this.each(function(index) {
			var barMenu = $(this).data('barMenu');
			if (barMenu) {
				barMenu.setSelectMenuItemAt(selectedIndex, animation);
			}
		});
		return this;
	};

}(jQuery));

// DOM 이 준비되면 호출
$(function() {

	// 사용자 정의 이벤트
	// barMenu 플러그인을 사용해 사용자 정의한 select 이벤트 리스너 등록하기
	var $barMenu = $('.bar-menu').barMenu();
	$barMenu.on('selected', function(e) {
		var oldIndex = -1;
		if (e.$oldItem) {
			oldIndex = e.$oldItem.index();
		}

		console.log('old = ' + oldIndex + ', new = ' + e.$newItem.index());
	});

	// #barMenu1의 1번째 메뉴 아이템 선택 처리
	$barMenu.eq(0).selectBarMenuAt(1, false);

	// #barMenu1의 4번째 메뉴 아이템 선택 처리
	$barMenu.eq(1).selectBarMenuAt(4, false);

});

/**
 * -------------------------- 
 * 생성자(클래스) 정의
 * --------------------------
 **/

function BarMenu(selector) {
	// 프로퍼티 생성
	this.$barMenu = null;
	this._$menuBody = null;
	this._$menuItems = null;
	this._$overItem = null;
	this._$bar = null;

	// 선택 메뉴 아이템
	this.$selectItem = null;

	this._init(selector);
	this._initEvent();
}

BarMenu.prototype = {
	// 요소 초기화
	"_init": function(selector) {
		this.$barMenu = $(selector);
		this._$menuBody = this.$barMenu.find('.menu-body');
		this._$menuItems = this._$menuBody.find('li');
		this._$bar = this.$barMenu.find('.bar');
	},

	// 이벤트 초기화
	"_initEvent": function() {
		var _self = this;

		// 오버 메뉴 및 선택(클릭한)메뉴 이벤트 호출
		this._$menuItems.on('mouseenter click', function(e) {
			var $this = $(this);
			if (e.type == 'mouseenter') {
				_self._setOverMenuItem($this);
			} else if (e.type == 'click') {
				_self.setSelectMenuItem($this);
			}
		});

		// 전체 메뉴 영역을 벗어난 경우
		this.$barMenu.on('mouseleave', function() {
			var $this = $(this);

			// 기존 오버 메뉴아이템이 있는 경우 제거
			_self._removeOverItem($this);

			// 기존 선택한 메뉴아이템이 있는 경우 선택처리
			_self._reSelectMenuItem();

		});

	},

	// 오버 메뉴아이템 처리하기
	"_setOverMenuItem": function($item) {

		// 기존 오버되어 있는 아이템이 있다면 over 스타일을 제거
		if (this._$overItem) {
			this._$overItem.removeClass('over');
		}

		// 신규 오버 메뉴아이템이 선택한 메뉴아이템과 같지 않은 경우에만 메뉴아이템 스타일 적용하기
		// 선택 메뉴 아이템 인덱스 값 구하기
		var selectIndex = -1;
		if (this.$selectItem != null) {
			selectIndex = this.$selectItem.index();
		}

		// 신규 오버 메뉴아이템 인덱스 값과 선택한 메뉴아이템의 인덱스 값을 비교
		if ($item.index() != selectIndex) {
			this._$overItem = $item;
			this._$overItem.addClass('over');
		} else {
			this._$overItem = null;
		}

		// 메뉴바 이동
		this._moveBar($item);
	},

	// 전체 메뉴 영역 벗어날 때 오버 효과 제거
	"_removeOverItem": function() {
		if (this._$overItem) {
			this._$overItem.removeClass('over');
		}
		this._$overItem = null;
		this._moveBar(null);
	},

	// 이동 메뉴 효과
	"_moveBar": function($item, animation) {
		var left = -100,
			width = 0;

		if ($item != null) {
			left = $item.position(true).left + parseInt($item.css('margin-left'));
			width = $item.outerWidth();
		}

		if (animation == false) {
			// 애니메이션 없이 바로 이동
			this._$bar.css({
				'left': left,
				'width': width
			})
		} else {
			// 애니메이션 이동
			this._$bar
				.stop()
				.animate({
					'left': left,
					'width': width
				}, 300)
		}
	},

	// 선택(클릭) 메뉴 아이템 처리
	'setSelectMenuItem': function($item, aniamtion) {
		var $oldItem = this.$selectItem;

		// 기존에 선택한 메뉴가 있는 경우 처리
		if (this.$selectItem) {
			this.$selectItem.removeClass('select');
		}

		this.$selectItem = $item;
		this.$selectItem.addClass('select');

		// 메뉴바 이동
		this._moveBar($item, aniamtion);

		// 사용자 정의 이벤트 발생(호출)
		this._dispatchSelectEvent($oldItem, $item);
	},

	// 기존 선택한 메뉴아이템이 있는 경우 선택 처리
	"_reSelectMenuItem": function() {
		if (this.$selectItem) {
			this._moveBar(this.$selectItem);
		}
	},

	// 메뉴아이템이 선택된 상태에서 시작하도록 설정하는 경우
	'setSelectMenuItemAt': function(index, animation) {
		var target = this._$menuItems.eq(index);
		this.setSelectMenuItem(target, animation);
	},

	// 사용자 정의 이벤트 발생
	"_dispatchSelectEvent": function($oldItem, $newItem) {
		var customEvent = jQuery.Event('selected');
		customEvent.$oldItem = $oldItem;
		customEvent.$newItem = $newItem;
		this.$barMenu.trigger(customEvent);
	}

};