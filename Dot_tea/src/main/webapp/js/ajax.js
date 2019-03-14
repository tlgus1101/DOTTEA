var ajax = {};
ajax.xhr = {};

ajax.xhr.Request = function(url, params, callback, method) {
	this.url = url;
	this.params = params;
	this.callback = callback;
	this.method = method;
	this.send();
}
ajax.xhr.Request.prototype = {
	getXMLHttpRequest: function() {
		if (window.ActiveXObject) {
			try {
				return new ActiveXObject("Msxml2.XMLHTTP");
			} catch(e) {
				try {
					return new ActiveXObject("Microsoft.XMLHTTP");
				} catch(e1) { return null; }
			}
		} else if (window.XMLHttpRequest) {
			return new XMLHttpRequest();
		} else {
			return null;
		}		
	},
	send: function() {
		this.req = this.getXMLHttpRequest();
		
		var httpMethod = this.method ? this.method : 'GET';
		if (httpMethod != 'GET' && httpMethod != 'POST') {
			httpMethod = 'GET';
		}
		var httpParams = (this.params == null || this.params == '') ? 
		                 null : this.params;
		var httpUrl = this.url;
		if (httpMethod == 'GET' && httpParams != null) {
			httpUrl = httpUrl + "?" + httpParams;
		}
		this.req.open(httpMethod, httpUrl, true);
		this.req.setRequestHeader(
			'Content-Type', 'application/x-www-form-urlencoded');
		var request = this;
		this.req.onreadystatechange = function() {
			request.onStateChange.call(request);
		}
		this.req.send(httpMethod == 'POST' ? httpParams : null);
	},
	onStateChange: function() {
		this.callback(this.req);
	}
}

ajax.Event = {};
ajax.Event.addListener = function(element, name, observer, useCapture) {
    useCapture = useCapture || false;

	if (element.addEventListener) {
		element.addEventListener(name, observer, useCapture);
	} else if (element.attachEvent) {
		element.attachEvent('on' + name, observer);
	}
}
ajax.Event.removeListener = function(element, name, observer, useCapture) {
	useCapture = useCapture || false;
	
	if (element.removeEventListener) {
		element.removeEventListener(name, observer, useCapture);
	} else if (element.detachEvent) {
		element.detachEvent('on' + name, observer);
	}
}
ajax.Event.getTarget = function(event) {
	if (event == null) return null;
	if (event.target) return event.target;
	else if (event.srcElement) return event.srcElement;
	return null;
}
ajax.Event.getMouseXY = function(event) {
	var mouseX = event.clientX;
	var mouseY = event.clientY;
	
	var dd = document.documentElement;
	var db = document.body;
	if (dd) {
		mouseX += dd.scrollLeft;
		mouseY += dd.scrollTop;
	} else if (db) {
		mouseX += db.scrollLeft;
		mouseY += db.scrollTop;
	}
	return {x: mouseX, y: mouseY};
}
ajax.Event.isLeftButton= function(event) {
	return (event.which) ? 
	       event.which == 1 && event.button == 0 :
	       (event.type == 'click') ? event.button == 0 : event.button == 1;
}
ajax.Event.isRightButton = function(event) {
	return event.button == 2;
}
ajax.Event.stopPropagation = function(event) {
	if (event.stopPropagation) {
	    event.stopPropagation();
	} else {
	    event.cancelBubble = true;
	}
}
ajax.Event.preventDefault = function(event) {
	if (event.preventDefault) {
	    event.preventDefault();
	} else {
	    event.returnValue = false;
	}
}
ajax.Event.stopEvent = function(event) {
	ajax.Event.stopPropagation(event);
	ajax.Event.preventDefault(event);
}
ajax.Event.bindAsListener = function(func, obj) {
	return function() {
		return func.apply(obj, arguments);
	}
}
