import 'package:build_runner/build_runner.dart';
import 'package:serializable/action.dart';


main() async {
  // In next line replace `example/*.dart` for the globs you want to use as input, for example `**/*.dart`
  // to take all the dart files of the project as input.
  await build([serializableAction(const ['example/*.dart'])],deleteFilesByDefault: true);
}
