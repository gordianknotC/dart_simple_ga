/// Support for doing something awesome.
///
/// More dartdocs go here.
library ga_simple;

export 'src/loader.dart'
   if (dart.library.io) 'src/mobile/ga_mobile.dart'
   if (dart.library.html) 'src/web/ga_web.dart'
;
