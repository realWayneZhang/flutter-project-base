import 'package:flutter_youniu_app/generated/json/base/json_convert_content.dart';
import 'package:flutter_youniu_app/generated/json/base/base_req_model.dart';


BaseReqModel $BaseReqModelFromJson<T>(Map<String, dynamic> json) {
	final BaseReqModel baseReqModel = BaseReqModel();
	final String? userToken = jsonConvert.convert<String>(json['userToken']);
	if (userToken != null) {
		baseReqModel.userToken = userToken;
	}
	final T? data = jsonConvert.convert<T>(json['data']);
	if (data != null) {
		baseReqModel.data = data;
	}
	return baseReqModel;
}

Map<String, dynamic> $BaseReqModelToJson(BaseReqModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['userToken'] = entity.userToken;
	data['data'] = entity.data?.toJson();
	return data;
}