import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'generator.dart';

/// Creates a serializable `builder`.
Builder builder(BuilderOptions _) => SharedPartBuilder([SerializableGenerator()], 'serializable'); //
