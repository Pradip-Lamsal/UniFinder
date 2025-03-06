class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);
  //static const String baseUrl = "http://10.0.2.2:5001/api/";
  //static const String baseUrl = "http://172.26.19.88:5001/api/";
  static const String baseUrl = "http://192.168.172.3:5001/api/";

  // For iPhone
  //static const String baseUrl = "http://localhost:3000/api/v1/";
  // ====================== Auth Routes ======================
  static const String login = "auth/login";
  static const String register = "auth/register";
  static const String universities = "universities";
  static const String course = "courses";
  static const String consultancies = "consultancies";

  //static const String imageUrl = "http://10.0.2.2:5001/uploads/";
  static const String imageUrl = "http://192.168.172.3:5001/uploads/";
  //static const String imageUrl = "http://172.26.19.88:5001/uploads/";
  //192.168.101.8
  static const String uploadImage = "auth/uploadImage";
}
