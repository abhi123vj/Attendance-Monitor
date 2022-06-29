import 'dart:convert';

BaseResponse baseResponseFromJson(Map<String,dynamic> str) => BaseResponse.fromJson(str);

String baseResponseToJson(BaseResponse data) => json.encode(data.toJson());

class BaseResponse {
    BaseResponse({
        required this.success,
        this.message,
        this.errorMessage,
    });

    bool success;
    String? message;
    String ?errorMessage;

    factory BaseResponse.fromJson(Map<String, dynamic> json) => BaseResponse(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        errorMessage: json["errorMessage"] == null ? null : json["errorMessage"],
    );

    Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "'message": message == null ? null : message,
        "errorMessage": errorMessage == null ? null : errorMessage,
    };
}