import 'package:build_runner/build_runner.dart';
import 'package:serializable/action.dart';


main() async {
  await build([serializableAction(const ['test/**.dart'])], deleteFilesByDefault: true);
}
