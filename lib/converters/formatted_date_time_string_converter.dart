import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

typedef Converter = JsonConverter<String, String>;

class FormattedDateTimeStringConverter implements Converter {
  const FormattedDateTimeStringConverter();

  @override
  String fromJson(String json) {
    final dateFormat = DateFormat('yyyy年MM月dd日');
    final dateTime = DateTime.parse(json);
    return dateFormat.format(dateTime);
  }

  @override
  String toJson(String object) {
    throw UnimplementedError();
  }
}
