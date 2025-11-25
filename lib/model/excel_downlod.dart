class ExcelDownloadModel {
  final bool success;
  final String message;
  final String url;

  ExcelDownloadModel({
    required this.success,
    required this.message,
    required this.url,
  });

  factory ExcelDownloadModel.fromJson(Map<String, dynamic> json) {
    return ExcelDownloadModel(
      success: json["success"] ?? false,
      message: json["message"] ?? "",
      url: json["url"] ?? "",
    );
  }
}
