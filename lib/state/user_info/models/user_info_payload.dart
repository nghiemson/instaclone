import 'dart:collection';

import 'package:flutter/foundation.dart' show immutable;

@immutable
class UserInfoPayload extends MapView<String, String> {
  const UserInfoPayload(Map<String, String> map) : super(map);
}
