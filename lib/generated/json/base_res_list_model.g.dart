import 'package:flutter_youniu_app/generated/json/base/json_convert_content.dart';
import 'package:flutter_youniu_app/generated/json/base/base_res_list_model.dart';


BaseResListModel $BaseResListModelFromJson<T>(Map<String, dynamic> json) {
	final BaseResListModel baseResListModel = BaseResListModel();
	final String? code = jsonConvert.convert<String>(json['code']);
	if (code != null) {
		baseResListModel.code = code;
	}
	final List<T>? data = jsonConvert.convertListNotNull<T>(json['data']);
	if (data != null) {
		baseResListModel.data = data;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		baseResListModel.message = message;
	}
	final bool? success = jsonConvert.convert<bool>(json['success']);
	if (success != null) {
		baseResListModel.success = success;
	}
	return baseResListModel;
}

Map<String, dynamic> $BaseResListModelToJson(BaseResListModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['code'] = entity.code;
	data['data'] =  entity.data.map((v) => v.toJson()).toList();
	data['message'] = entity.message;
	data['success'] = entity.success;
	return data;
}