import 'package:build_runner/build_runner.dart';
import 'package:serializable/generator.dart';
import 'package:source_gen/source_gen.dart';

/// Creates a `serializable` generator-builder phase.
///
/// Example: {@example /tool/build.dart}
serializablePhase([Iterable<String> globs = const ['bin/**.dart', 'web/**.dart', 'lib/**.dart']]) =>
    new Phase()..addAction(
        new GeneratorBuilder(const [const SerializableGenerator()]),
        new InputSet(new PackageGraph.forThisPackage().root.name, globs));