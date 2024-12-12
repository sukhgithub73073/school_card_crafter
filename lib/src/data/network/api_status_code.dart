
abstract class RepoResponseStatus {
  static const int error = 500;
  static const String success = "success";
  static const int authentication = 401;
  static const int subscriptionExpire = 0;
  static const int platformException = 400;
  static const int notFoundException = 404;
  static const int serverIsTemporarilyUnable = 503;
}
