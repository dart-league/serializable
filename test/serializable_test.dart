// Copyright (c) 2017, Luis Vargas. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:io';

import 'package:build/build.dart';
import 'package:build_test/build_test.dart';
import 'package:serializable/generator.dart';
import 'package:source_gen/source_gen.dart';
import 'package:test/test.dart';

void main() {
  test('generated files', () async {
    expect(await generate(await new File('example/person.dart').readAsString()),
        await new File('example/person.g.dart').readAsString());
  });
}

final String pkgName = 'pkg';

final Builder builder = new GeneratorBuilder([new SerializableGenerator()]);

Future<String> generate(String source) async {
  final srcs = <String, String>{
    'serializable|lib/serializable.dart': await new File('lib/serializable.dart').readAsString(),
    '$pkgName|lib/value.dart': source,
  };

  final writer = new InMemoryAssetWriter();
  await testBuilder(builder, srcs, rootPackage: pkgName, writer: writer);
  return writer.assets[new AssetId(pkgName, 'lib/value.g.dart')]?.value;
}
