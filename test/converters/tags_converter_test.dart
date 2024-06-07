import 'package:flutter_qiita_app/converters/tags_converter.dart';
import 'package:test/test.dart';

void main() {
  test('TagsConverter', () {
    const json = [
      {
        'name': 'Ruby',
        'versions': ['0.0.1'],
      },
    ];
    final tags = const TagsConverter().fromJson(json);
    expect(tags, ['Ruby']);
  });
}
