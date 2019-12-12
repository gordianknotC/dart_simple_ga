/// Support for doing something awesome.
///
/// More dartdocs go here.
library ga_simple;

export 'loader.dart'
   if (dart.library.io) 'mobile/ga_mobile.dart'
   if (dart.library.html) 'web/ga_web.dart'
;
