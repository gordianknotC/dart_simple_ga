import 'dart:io';
import 'package:usage/usage_io.dart';

import '../sketches/ga_sketch.dart';


class GoogleAnalytics implements AnalyticsSketch{
	late AnalyticsIO _delegate;
	
	GoogleAnalytics({
		required String trackingId,
    required String applicationName,
    required String applicationVersion,
    required String analyticsUrl,
    required String documentDirectory
	}){
		_delegate = AnalyticsIO(
			trackingId, applicationName, applicationVersion,
			analyticsUrl: analyticsUrl, documentDirectory: Directory(documentDirectory)
		);
		
	}
	
  @override
  void sendEvent(String category, String action, {String? label, Map<String,String>? parameters, int? value}) {
		_delegate.sendEvent(category, action, label: label, parameters: parameters, value: value);
  }

  @override
  void sendException(String description, {bool? fatal}) {
    _delegate.sendException(description, fatal: fatal);
  }

  @override
  void sendPageView({String? viewName, Map<String,String>? parameters}) {
		_delegate.sendScreenView(viewName, parameters: parameters);
  }

  @override
  void sendTiming(String category, String variable, int valueMillis, {String? label}) {
    _delegate.sendTiming(variable, valueMillis, label: label, category: category);
  }
	
}

