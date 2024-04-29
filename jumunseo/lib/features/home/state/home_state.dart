import 'package:hive/hive.dart';

class HomeState {
  final box = Hive.box("myBox");

  int testNum = 0;

  //copywith
  HomeState copyWith({
    int? testNum,
  }) {
    return HomeState()..testNum = testNum ?? this.testNum;
  }
}
