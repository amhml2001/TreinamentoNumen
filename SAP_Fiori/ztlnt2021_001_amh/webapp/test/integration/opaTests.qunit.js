/* global QUnit */

QUnit.config.autostart = false;

sap.ui.getCore().attachInit(function() {
	"use strict";

	sap.ui.require([
		"numen/talentos/ztlnt2021001amh/test/integration/AllJourneys"
	], function() {
		QUnit.start();
	});
});