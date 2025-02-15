import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:systemapp/api_services.dart';
import 'package:tuple/tuple.dart';

final loginUserProvider = FutureProvider.family.autoDispose<List<dynamic>, Tuple2>((ref, tuple) {
  final apiservices = ref.watch(apiServicesProvider);

  return apiservices.loginUser(tuple.item1, tuple.item2);
});

final UserDetailsProvider = FutureProvider.family.autoDispose<List<dynamic>, String>((ref, email) {
  final apiservices = ref.watch(apiServicesProvider);

  return apiservices.userdetails(email);
});

final fetchDetailsProvider = FutureProvider.family.autoDispose<List<dynamic>, String>((ref, staff_id) {
  final apiservices = ref.watch(apiServicesProvider);

  return apiservices.myprofile(staff_id);
});