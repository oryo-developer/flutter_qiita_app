import 'dart:math';

import 'package:retrofit/retrofit.dart';

extension HttpResponseExtension on HttpResponse {
  int get maxPage {
    const maxMaxPage = 100;
    const perPage = 20;
    final totalCount = int.parse(response.headers.value('Total-Count') ?? '0');
    return min(maxMaxPage, (totalCount / perPage).ceil());
  }
}
