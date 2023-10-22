import 'datum.dart';

class GovernoratesModel {
	List<Datum>? data;
	String? message;
	List<dynamic>? error;
	int? status;

	GovernoratesModel({this.data, this.message, this.error, this.status});

	factory GovernoratesModel.fromJson(Map<String, dynamic> json) {
		return GovernoratesModel(
			data: (json['data'] as List<dynamic>?)
						?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
						.toList(),
			message: json['message'] as String?,
			error: json['error'] as List<dynamic>?,
			status: json['status'] as int?,
		);
	}



	Map<String, dynamic> toJson() => {
				'data': data?.map((e) => e.toJson()).toList(),
				'message': message,
				'error': error,
				'status': status,
			};
}
