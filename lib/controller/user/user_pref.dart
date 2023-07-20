import 'package:get_storage/get_storage.dart';

class UserPref {
  static final _box = GetStorage('UserPref');
  
  final userName = ''.val('userName');



}