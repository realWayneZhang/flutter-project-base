import 'package:flutter_youniu_app/generated/json/base/json_field.dart';
import 'dart:convert';

import '../base_req_model.g.dart';
import 'json_convert_content.dart';

@JsonSerializable()
class BaseReqModel<T> {
	String userToken = '';
	T? data;

	BaseReqModel();

	BaseReqModel.fromJson(Map<String, dynamic> json) {

		if (json['data'] != null && json['data'] != 'null') {
			data = JsonConvert.fromJsonAsT(T)(json['data']);
		}

		final String? userToken = jsonConvert.convert<String>(json['userToken']);
		if (userToken != null) {
			this.userToken = userToken;
		}
	}

	Map<String, dynamic> toJson() => $BaseReqModelToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}