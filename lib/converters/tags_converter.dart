import 'package:freezed_annotation/freezed_annotation.dart';

class TagsConverter implements JsonConverter<List<String>, List> {
  const TagsConverter();

  @override
  List<String> fromJson(List json) {
    return json.map<String>((json) {
      return json['name'];
    }).toList();
  }

  @override
  List toJson(List<String> object) {
    throw UnimplementedError();
  }
}
