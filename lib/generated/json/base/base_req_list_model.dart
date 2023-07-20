import 'package:flutter_youniu_app/generated/json/base/json_field.dart';
import 'package:flutter_youniu_app/generated/json/base_req_list_model.g.dart';
import 'dart:convert';

import 'json_convert_content.dart';

@JsonSerializable()
class BaseReqListModel<T> {
	String userToken = '';
	List<T> data = [];

	BaseReqListModel();

	BaseReqListModel.fromJson(Map<String, dynamic> json) {

		if (json['data'] != null && json['data'] != 'null') {
			data = JsonConvert.fromJsonAsT(T)(json['data']);
		}

		final String? userToken = jsonConvert.convert<String>(json['userToken']);
		if (userToken != null) {
			this.userToken = userToken;
		}
	}

	Map<String, dynamic> toJson() => $BaseReqListModelToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}