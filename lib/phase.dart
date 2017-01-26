import 'package:build_runner/build_runner.dart';
import 'package:serializable/generator.dart';
import 'package:source_gen/source_gen.dart';

/// Creates a `serializable` generator-builder phase.
///
/// Example: {@example /tool/build.dart}
serializablePhase(String packageName, Iterable<String> globs) =>
    new Phase()..addAction(
        new GeneratorBuilder(const [const SerializableGenerator()]),
        new InputSet(packageName, globs));