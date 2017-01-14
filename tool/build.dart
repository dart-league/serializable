import 'package:build_runner/build_runner.dart';
import 'package:serializable/serializable_phase.dart';


main() async {
  await build(new PhaseGroup()
    ..addPhase(
    // In next line replace `serializable` for the name of your package
    // and `example/*.dart` for the globs you want to use as input, for example `**/*.dart`
    // to take all the dart files of the project as input.
        serializablePhase('serializable', const ['example/*.dart'])),
      deleteFilesByDefault: true);
}