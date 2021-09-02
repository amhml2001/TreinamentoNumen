/* global QUnit */
QUnit.config.autostart = false;

sap.ui.getCore().attachInit(function () {
	"use strict";

	sap.ui.require([
		"numentalentos./app_001_amh/test/unit/AllTests"
	], function () {
		QUnit.start();
	});
});
