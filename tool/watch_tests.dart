import 'package:build_runner/build_runner.dart';
import 'package:serializable/action.dart';


main() async {
  await watch([serializableAction(const ['test/**.dart'])], deleteFilesByDefault: true).drain();
}
