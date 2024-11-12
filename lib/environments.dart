import 'package:flutter/foundation.dart' show kReleaseMode;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get fileName =>
      kReleaseMode ? ".env.production" : ".env.development";
  static String get hrURL => dotenv.env['HR_ADMIN']!;
  
}