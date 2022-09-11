
import 'package:get/get.dart';

import 'lang/ar.dart';
import 'lang/en.dart';



class Translation extends Translations {

  @override
  Map<String, Map<String, String>> get keys => {'en_US': en, 'ar_EG': ar};

  List<String>? get locales {
    map(key) {
      return key.split("_")[0];
    }

    return keys.keys.map(map).toList() as List<String>?;
  }

}

