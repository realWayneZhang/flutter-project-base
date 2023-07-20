import 'package:flutter_youniu_app/generated/json/base/json_field.dart';
import 'package:flutter_youniu_app/generated/json/base_res_list_model.g.dart';
import 'dart:convert';

import 'json_convert_content.dart';

@JsonSerializable()
class BaseResListModel<T> {
	String code = '';
	List<T> data = [];
	String message = '';
	bool success = false;

	BaseResListModel();

	BaseResListModel.fromJson(Map<String, dynamic> json) {
		if (json['data'] != null && json['data'] != 'null') {
			data = JsonConvert.fromJsonAsT(T)(json['data']);
		} else {
			data = [];
		}

		final String? code = jsonConvert.convert<String>(json['code']);
		if (code != null) {
			this.code = code;
		}

		final String? message = jsonConvert.convert<String>(json['message']);
		if (message != null) {
			this.message = message;
		}

		final bool? success = jsonConvert.convert<bool>(json['success']);
		if (message != null) {
			this.success = success!;
		}
	}

	Map<String, dynamic> toJson() => $BaseResListModelToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}