abstract class AnalyticsSketch {
	AnalyticsSketch(
			String trackingId, String applicationName, String applicationVersion, {
			String analyticsUrl, String documentDirectory
	});
	
	void sendPageView({String viewName, Map<String,String> parameters});
	void sendEvent(String category, String action, {String label, Map<String,String> parameters, int value});
	void sendTiming(String category, String variable, int valueMillis, {String label});
	void sendException(String description, {bool fatal});
}


