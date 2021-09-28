class DataResponse<T> {
  DataResponse({
    this.success,
    this.content,
    this.error,
  });

  bool? success;
  T? content;
  Error? error;

  factory DataResponse.fromJson(Map<String, dynamic> json, T content) =>
      DataResponse<T>(
        success: json["success"] == null ? null : json["success"],
        content: content,
        error: json["error"] == null ? null : Error.fromJson(json["error"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "content": content,
        "error": error == null ? null : error!.toJson(),
      };
}

class Error {
  Error({
    this.code,
    this.message,
  });

  int? code;
  String? message;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        code: json["code"] == null ? null : json["code"],
        message: json["message"] == null ? null : json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "message": message == null ? null : message,
      };
}
