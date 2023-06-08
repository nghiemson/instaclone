import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instaclone/state/auth/backend/authenticator.dart';
import 'package:instaclone/state/auth/models/auth_result.dart';
import 'package:instaclone/state/auth/models/auth_state.dart';
import 'package:instaclone/state/user_info/backend/user_info_storage.dart';

import '../../posts/typedefs/user_id.dart';

class AuthStateNotifier extends StateNotifier<AuthState> {
  final _authenticator = const Authenticator();
  final _userInfoStorage = const UserInfoStorage();
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
    final result = await _authenticator.loginWithGoogle();
    final userId = _authenticator.userId;
    if (result == AuthResult.success && userId != null) {
      await saveUserInfo(userId: userId);
    }
    state = AuthState(result: result, userId: userId, isLoading: false);
  }

  Future<void> loginWithFb() async {
    state = state.copiedWithIsLoading(true);
    final result = await _authenticator.loginWithFB();
    final userId = _authenticator.userId;
    if (result == AuthResult.success && userId != null) {
      await saveUserInfo(userId: userId);
    }
    state = AuthState(result: result, userId: userId, isLoading: false);
  }

  Future<void> saveUserInfo({required UserId userId}) =>
      _userInfoStorage.saveUserInfo(
        userId: userId,
        displayName: _authenticator.displayName,
        email: _authenticator.email,
      );
}
