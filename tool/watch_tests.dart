import 'package:build_runner/build_runner.dart';
import 'package:serializable/phase.dart';


main() async {
  await watch([serializablePhase(const ['test/**.dart'])], deleteFilesByDefault: true);
}