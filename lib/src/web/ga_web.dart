// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library ga.web;

import 'dart:js';
//import 'package:gtag_analytics/src/gtag_analytics.dart' as _gtag;

import '../sketches/ga_sketch.dart';

/*
class AnalyticsWeb implements AnalyticsSketch{
	_gtag.GoogleAnalytics delegate;
	AnalyticsWeb({bool failSilently}){
		delegate = _gtag.GoogleAnalytics(failSilently: failSilently ?? false);
	}

  @override
  void sendEvent(String category, String action, {String label, Map<String, String> parameters, int value}) {
    // TODO: implement sendEvent
  }
	void _sendEvent(String eventName, Options options) {
		try {
			gtag(_event, eventName, options);
			// ignore: avoid_catching_errors
		} on NoSuchMethodError catch (e) {
			if (!failSilently) {
				throw new StateError('gtag function not found. Please make sure you '
						'include the Google Analytics script in your HTML. ($e)');
			}
		}
	}

  @override
  void sendException(String description, {bool fatal}) {
    // TODO: implement sendException
  }

  @override
  void sendPageView({String viewName, Map<String, String> parameters}) {
    // TODO: implement sendPageView
  }

  @override
  void sendTiming(String category, String variable, int valueMillis, {String label}) {
    // TODO: implement sendTiming
  }

}
*/

/// Very lightweight Google Analytics integration. This class depends on having
/// the JavaScript GA library available.
class GoogleAnalytics implements AnalyticsSketch {
  GoogleAnalytics({
    required String trackingId,
      required String applicationName,
      required String applicationVersion,
      required String analyticsUrl,
      required String documentDirectory});

  bool get _isAvailable => _gaFunction != null;

  @override
  void sendPageView({String? viewName, Map<String, String>? parameters}) =>
      _ga2('send', 'pageview', {
        viewName: viewName,
        parameters: parameters
      });

  @override
  void sendEvent(String category, String action,
      {String? label, Map<String, String>? parameters, int? value}) {
    assert(
        parameters == null && value == null,
        UnimplementedError(
            "param and value are not implemented on web platform"));
    Map m = <String, String>{
      'hitType': 'event',
      'eventCategory': category,
      'eventAction': action
    };
    if (label != null) m['eventLabel'] = label;
    _ga('send', m);
  }

  @override
  void sendTiming(String category, String variable, int valueMillis,
      {String? label}) {
    Map m = <String, dynamic>{
      'hitType': 'timing',
      'timingCategory': category,
      'timingVar': variable,
      'timingValue': valueMillis
    };
    if (label != null) m['timingLabel'] = label;
    _ga('send', m);
  }

  @override
  void sendException(String description, {bool? fatal}) {
    Map m = <String, String>{'exDescription': description};
    if (fatal != null) m['exFatal'] = fatal;
    _ga2('send', 'exception', m);
  }

  void _ga(String method, [Map? args]) {
    if (_isAvailable) {
      List params = <dynamic>[method];
      if (args != null) params.add(JsObject.jsify(args));
      _gaFunction.apply(params);
    }
  }

  void _ga2(String method, String type, [Map? args]) {
    if (_isAvailable) {
      List params = <dynamic>[method, type];
      if (args != null) params.add(JsObject.jsify(args));
      _gaFunction.apply(params);
    }
  }

  JsFunction get _gaFunction => context['gtag'] as JsFunction;
}
