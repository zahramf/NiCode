import 'package:hive/hive.dart';
import 'package:nicode/model/path.dart';

class Boxes {
  static Box<Path> getPath() => Hive.box<Path>('path');
}
