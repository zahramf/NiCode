import 'package:hive/hive.dart';

part 'path.g.dart';

@HiveType(typeId: 0)
class Path extends HiveObject {
  @HiveField(0)
  late String choose;
}
