
import 'package:card_craft/src/data/models/response_model.dart';

abstract class SchoolRepository {
  Future<ResponseModel> getSchoolDetail({required Map<String ,dynamic> map});
}
class SchoolRepositoryImp extends SchoolRepository{
  @override
  Future<ResponseModel> getSchoolDetail({required Map<String, dynamic> map}) async {
    ResponseModel model = await ResponseModel(success: false,data: null,errors: null,message: "");
    Future.delayed(Duration(seconds: 5)) ;
    return model;
  }
}

