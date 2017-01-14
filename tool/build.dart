import 'package:build_runner/build_runner.dart';
import 'package:serializable/serializable_phase.dart';


main() async {
  await build(new PhaseGroup()..addPhase(
     serializablePhase('serializable', const ['example/*.dart'])),
      deleteFilesByDefault: true);
}