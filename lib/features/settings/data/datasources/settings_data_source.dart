import '../../../../core/local_storage/local_storage.dart';

abstract class SettingsDataSource {
  // Double Tap To Exit
  Future<bool> getDoubleTapToExit();
  Future<bool> setDoubleTapToExit(bool value);

  // Mask Sensitive Info
  Future<bool> getMaskSensitiveInfo();
  Future<bool> setMaskSensitiveInfo(bool value);

  // Refresh Rate
  Future<int> getRefreshRate();
  Future<bool> setRefreshRate(int value);

  // Server Timeout
  Future<int> getServerTimeout();
  Future<bool> setServerTimeout(int value);
}

const doubleTapToExit = 'doubleTapToExit';
const maskSensitiveInfo = 'maskSensitiveInfo';
const refreshRate = 'refreshRate';
const serverTimeout = 'serverTimeout';

class SettingsDataSourceImpl implements SettingsDataSource {
  final LocalStorage localStorage;

  SettingsDataSourceImpl({required this.localStorage});

  // Mask Sensitive Info
  @override
  Future<bool> getMaskSensitiveInfo() async {
    return Future.value(localStorage.getBool(maskSensitiveInfo) ?? false);
  }

  @override
  Future<bool> setMaskSensitiveInfo(bool value) {
    return localStorage.setBool(maskSensitiveInfo, value);
  }

  // Double Tap To Exit
  @override
  Future<bool> getDoubleTapToExit() async {
    return Future.value(localStorage.getBool(doubleTapToExit) ?? false);
  }

  @override
  Future<bool> setDoubleTapToExit(bool value) {
    return localStorage.setBool(doubleTapToExit, value);
  }

  // Refresh Rate
  @override
  Future<int> getRefreshRate() async {
    return Future.value(localStorage.getInt(refreshRate) ?? 0);
  }

  @override
  Future<bool> setRefreshRate(int value) {
    return localStorage.setInt(refreshRate, value);
  }

  // Server Timeout
  @override
  Future<int> getServerTimeout() async {
    return Future.value(localStorage.getInt(serverTimeout) ?? 15);
  }

  @override
  Future<bool> setServerTimeout(int value) {
    return localStorage.setInt(serverTimeout, value);
  }
}
