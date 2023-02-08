import 'package:ga_simple/src/sketches/ga_sketch.dart';

class GoogleAnalytics implements AnalyticsSketch {
  GoogleAnalytics(
      {required String trackingId,
      required String applicationName,
      required String applicationVersion,
      required String analyticsUrl,
      required String documentDirectory});

  @override
  void sendEvent(String category, String action,
      {String? label, Map<String, String>? parameters, int? value}) {}

  @override
  void sendException(String description, {bool? fatal}) {}

  @override
  void sendPageView({String? viewName, Map<String, String>? parameters}) {}

  @override
  void sendTiming(String category, String variable, int valueMillis,
      {String? label}) {}
}
