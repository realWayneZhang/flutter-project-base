import 'package:flutter_youniu_app/generated/json/base/json_convert_content.dart';
import 'package:flutter_youniu_app/generated/json/base/base_res_model.dart';


BaseResModel $BaseResModelFromJson<T>(Map<String, dynamic> json) {
	final BaseResModel baseResModel = BaseResModel();
	final String? code = jsonConvert.convert<String>(json['code']);
	if (code != null) {
		baseResModel.code = code;
	}
	final T? data = jsonConvert.convert<T>(json['data']);
	if (data != null) {
		baseResModel.data = data;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		baseResModel.message = message;
	}
	final bool? success = jsonConvert.convert<bool>(json['success']);
	if (success != null) {
		baseResModel.success = success;
	}
	return baseResModel;
}

Map<String, dynamic> $BaseResModelToJson(BaseResModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['code'] = entity.code;
	data['data'] = entity.data?.toJson();
	data['message'] = entity.message;
	data['success'] = entity.success;
	return data;
}