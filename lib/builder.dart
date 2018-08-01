import 'package:build/build.dart';
import 'package:serializable_core/generator.dart';
import 'package:source_gen/source_gen.dart';

/// Creates a serializable `builder`.
Builder builder(_) => new PartBuilder(const [const SerializableGenerator()], '.g.dart');
