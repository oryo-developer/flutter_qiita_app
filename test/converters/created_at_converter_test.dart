import 'package:flutter_qiita_app/converters/created_at_converter.dart';
import 'package:test/test.dart';

void main() {
  test('CreatedAtConverter', () {
    const json = '2000-01-01T00:00:00+00:00';
    final createdAt = const CreatedAtConverter().fromJson(json);
    expect(createdAt, '2000年01月01日');
  });
}
