// file for testing custom weather from local .json
import 'package:flutter/services.dart';

Future<String> fetchFileFromAssets(String assetsPath) async {
  return rootBundle.loadString(assetsPath).then((file) => file);
}
