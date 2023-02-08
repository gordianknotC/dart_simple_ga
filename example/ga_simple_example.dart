import 'package:ga_simple/ga_simple.dart';

final documentDirectory = '';
GoogleAnalytics? _ga;
GoogleAnalytics get ga{
  return _ga ??= GoogleAnalytics(
      trackingId: 'your_id_here',
      analyticsUrl: 'http://your.url.net',
      applicationName: 'your_app_name',
      applicationVersion: '1.0.0',
      documentDirectory: documentDirectory
  );
}
