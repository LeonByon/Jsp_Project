(function() {
	'use strict';
	var Home;

	$(function() {
		var Home = new window.Home();
	});

	window.Home = (function() {
		function Home() {
			this.init();
		}

		Home.prototype.init = function() {
			this.cookie();
			this.cacheElements();
			return this.settingProperty();
		};

		Home.prototype.cookie = function() {
			if(!$.cookie("visited")) {
				$.cookie("visited", "true", {expires: 1, path: "/"});
			}
		};

		Home.prototype.cacheElements = function() {
			this.$btn = $("li.btn");
		};

		Home.prototype.settingProperty = function() {
			$("div#wrap").css("opacity", 0);

			return this.bindEvents();
		};

		Home.prototype.bindEvents = function() {
			var btn = this.$btn;
			var self = this;

			$(window).on({
				load: function() {
					self.loadAnimation();
				}
			});

			this.$btn.on({
				mouseenter: function() {
					$(this).velocity("sotp").velocity({"opacity": "0.6"}, 300);
				},
				mouseleave: function() {
					$(this).velocity("sotp").velocity({"opacity": "1"}, 300);
				}
			});
		};

		Home.prototype.loadAnimation = function() {
			$("div#wrap")
			.velocity({"opacity": "1"}, 1000);
		};

		return Home;
	})();
}());