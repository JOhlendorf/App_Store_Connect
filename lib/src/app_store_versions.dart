import 'dart:convert';

import 'package:http/http.dart' as http;

import 'http_client.dart';
import 'jwt.dart';
import 'models/build.dart';

class AppStoreVersions {
  final String _issuer;
  final String _keyId;
  final String _keyFileContent;

  AppStoreVersions(this._issuer, this._keyId, this._keyFileContent);

  /// Gets a list of all versions
  Future<List<Build>> getAllVersions() async {
    var jwt = createJWT(_issuer, _keyFileContent, _keyId);

    var response = await get(
        'https://api.appstoreconnect.apple.com/v1/6471971574/appStoreVersions',
        jwt);

    print('Response: $response Data: ${jsonDecode(response.body)}');
    var builds = _convertResponseToListOfBuilds(response);

    return builds;
  }

  List<Build> _convertResponseToListOfBuilds(http.Response response) {
    dynamic jsonResponse = jsonDecode(response.body);
    List<dynamic> allProfiles = jsonResponse['data'] as List<dynamic>;

    var profiles = allProfiles
        .map((dynamic e) => Build.fromJson(e as Map<String, dynamic>))
        .toList();

    return profiles;
  }
}
