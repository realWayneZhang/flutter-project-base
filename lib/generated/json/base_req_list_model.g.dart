import 'package:flutter_youniu_app/generated/json/base/json_convert_content.dart';
import 'package:flutter_youniu_app/generated/json/base/base_req_list_model.dart';

BaseReqListModel $BaseReqListModelFromJson<T>(Map<String, dynamic> json) {
	final BaseReqListModel baseReqListModelEntity = BaseReqListModel();
	final String? userToken = jsonConvert.convert<String>(json['uToken']);
	if (userToken != null) {
		baseReqListModelEntity.userToken = userToken;
	}
	final List<T>? data = jsonConvert.convertListNotNull<T>(json['data']);
	if (data != null) {
		baseReqListModelEntity.data = data;
	}
	return baseReqListModelEntity;
}

Map<String, dynamic> $BaseReqListModelToJson(BaseReqListModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['userToken'] = entity.userToken;
	data['data'] =  entity.data;
	return data;
}