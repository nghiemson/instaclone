import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instaclone/state/auth/backend/authenticator.dart';
import 'package:instaclone/state/auth/models/auth_result.dart';
import 'package:instaclone/state/auth/models/auth_state.dart';

class AuthStateNotifier extends StateNotifier<AuthState> {
  final _authenticator = const Authenticator();
  AuthStateNotifier() : super(const AuthState.unknown()) {
    if (_authenticator.isAlreadyLoggedIn) {
      state = AuthState(
        result: AuthResult.success,
        userId: _authenticator.userId,
        isLoading: false,
      );
    }
  }

  Future<void> logOut() async {
    state = state.copiedWithIsLoading(true);
    await _authenticator.logOut();
    state = const AuthState.unknown();
  }

  Future<void> loginWithGg() async {
    state = state.copiedWithIsLoading(true);
    final res = await _authenticator.loginWithGoogle();
    final userId = _authenticator.userId;
    if (res == AuthResult.success && userId != null) {}
  }
}
