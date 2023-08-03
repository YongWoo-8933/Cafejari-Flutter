import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/data/remote/dto/user/user_response.dart';
import 'package:cafejari_flutter/data/repository/user_repository.dart';
import 'package:cafejari_flutter/domain/entity/user/user.dart';


/// getGrades의 실제 구현부
class GetGrades {
  Future<Grades> call({required UserRepository userRepository}) async {
    try {
      List<GradeResponse> gradeResponseList = await userRepository.fetchGrade();
      Grades grades = [];
      for(GradeResponse gradeResponse in gradeResponseList) {
        grades.add(Grade(
            id: gradeResponse.id,
            step: gradeResponse.step,
            updateCountRequirement: gradeResponse.sharing_count_requirement,
            updateRestrictionPerCafe: gradeResponse.sharing_restriction_per_cafe,
            stackRestrictionPerDay: gradeResponse.activity_stack_restriction_per_day,
            name: gradeResponse.name,
            imageUrl: gradeResponse.image ?? Grade.empty().imageUrl,
            description: gradeResponse.description ?? Grade.empty().description));
      }
      return grades;
    } on ErrorWithMessage {
      rethrow;
    }
  }
}
