import 'package:app_store_connect_apis/src/models/app_store_version.dart';
import 'package:app_store_connect_apis/src/provisioning.dart';

import 'builds.dart';
import 'models/build.dart';
import 'models/profile.dart';

class AppStoreConnect {
  final String _issuer;
  final String _keyId;
  late final String _keyFileContent;
  late final Provisioning _provisioning;
  late final Builds _builds;

  /// [_issuer] Your issuer ID from the API keys page in App Store Connect
  ///
  /// [_keyId] Your private key ID from App Store Connect
  ///
  /// [_keyFilePath] Path to the private key file from App Store Connect
  AppStoreConnect(this._issuer, this._keyId, this._keyFileContent) {
    _provisioning = Provisioning(_issuer, _keyId, _keyFileContent);
    _builds = Builds(_issuer, _keyId, _keyFileContent);
  }

  /// Gets a list of all provisioning profiles
  Future<List<Profile>> getAllProfiles() async {
    return _provisioning.getAllProfiles();
  }

  /// Downloads a specific provisioning profile which is defined by the [profileId]
  Future<Profile> downloadProfile(String profileId) async {
    return _provisioning.downloadProfile(profileId);
  }

  /// Gets a list of all uploaded builds
  Future<List<Build>> getAllBuilds() async {
    return _builds.getAllBuilds();
  }

  Future<List<AppStoreVersion>> getAppVersions() async {
    List<AppStoreVersion> res = List.empty(growable: true);

    return res;
  }
}
