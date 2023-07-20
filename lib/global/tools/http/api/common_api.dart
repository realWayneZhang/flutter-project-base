import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_youniu_app/generated/json/base/base_req_model.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../generated/json/base/base_res_model.dart';
import '../core/http.dart';


part 'common_api.g.dart';



@RestApi()
abstract class CommonApi {
  static final CommonApi api = CommonApi(Http.instance.dio);
  factory CommonApi(Dio dio) => _CommonApi(dio);

  @Headers(<String, String>{'accept': 'image/jpeg'})
  @POST('/api-common-source/api/area/list')
  Future<String> getCount( @Body() BaseReqModel<String> areaList);
}