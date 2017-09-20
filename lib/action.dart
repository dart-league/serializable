import 'package:build_runner/build_runner.dart';
import 'package:serializable/generator.dart';
import 'package:source_gen/source_gen.dart';

/// Creates a `serializable` generator-builder phase.
///
/// Example: {@example /tool/build.dart}
BuildAction serializableAction([Iterable<String> globs = const ['bin/**.dart', 'web/**.dart', 'lib/**.dart']]) =>
    new BuildAction(
        new PartBuilder(const [const SerializableGenerator()]),
        new PackageGraph.forThisPackage().root.name,
        inputs: globs);
