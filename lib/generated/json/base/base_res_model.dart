import 'package:flutter_youniu_app/generated/json/base/json_field.dart';
import 'package:flutter_youniu_app/generated/json/base_res_model.g.dart';
import 'package:flutter_youniu_app/generated/json/base/json_convert_content.dart';
import 'dart:convert';

@JsonSerializable()
class BaseResModel<T> {

	String code = '';
	T? data;
	String message = '';
	bool success = false;

	BaseResModel();

	BaseResModel.fromJson(Map<String, dynamic> json) {
		if (json['data'] != null && json['data'] != 'null') {
			data = JsonConvert.fromJsonAsT(T)(json['data']);
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

	Map<String, dynamic> toJson() => $BaseResModelToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}