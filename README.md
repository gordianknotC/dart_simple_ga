google analytics for dart on both web and mobile platform.

### Usage

```dart
final documentDirectory = '';
GoogleAnalytics _ga;
GoogleAnalytics get ga{
  return _ga ??= GoogleAnalytics(
      trackingId: 'your_id_here', analyticsUrl: 'http://your.url.net',
      applicationName: 'your_app_name', applicationVersion: '1.0.0',
      documentDirectory: documentDirectory
  );
}
```

#### GoogleAnalytics
```dart
class GoogleAnalytics implements AnalyticsSketch {
    GoogleAnalytics({ String trackingId, String applicationName, String applicationVersion, String analyticsUrl, String documentDirectory });
    
    @override
    void sendEvent(String category, String action, {String label, Map<String, String> parameters, int value}) {}
    
    @override
    void sendException(String description, {bool fatal}) {}
    
    @override
    void sendPageView({String viewName, Map<String, String> parameters}) {}
    
    @override
    void sendTiming(String category, String variable, int valueMillis, {String label}) {}
}

```