import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_app/features/shared/providers/loading/loading_notifier.dart';

final loadingProvider = StateNotifierProvider<LoadingNotifier, bool>((ref) {
  return LoadingNotifier();
});