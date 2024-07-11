import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart' show kDebugMode, kIsWeb, kReleaseMode;
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart'
as storage_secure;
import 'package:get/get.dart' as getx;
import 'package:get/get_connect/http/src/multipart/form_data.dart';
import 'package:http_parser/http_parser.dart';
import 'package:intl/intl.dart';
import 'package:mime/mime.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tanfeth_apps/common/network/network/api/api_response.dart';
import 'package:tanfeth_apps/common/network/network/api/internet_connection.dart';
import 'package:tanfeth_apps/common/network/network/enums/api_enum.dart';
import 'package:tanfeth_apps/common/shared/languages.dart';
import 'package:tanfeth_apps/common/shared/mode/app_mode.dart';
import 'package:dio/src/multipart_file.dart';
import 'package:dio/src/dio.dart';
import 'package:dio/src/options.dart';
import 'package:dio/src/adapters/io_adapter.dart';
import 'package:dio/src/interceptors/log.dart';
import 'package:dio/src/response.dart';


class FileMultiPart {
  final String key;
  final PlatformFile platformFile;
  FileMultiPart({required this.key, required this.platformFile});
}

class ApiController {
  static late String baseUrl;
  static String? refreshToken;
  static bool isCultureHeader = false;
  static String? appSecret;
  static String? apiKey;
  static String? userAgent;
  static String? authorization;
  static String? authorizationExpired;
  static late String serverErrorMessage, connectErrorMessage;
  static String? refreshTokenUrl;
  static String? revokeTokenUrl;
  static Map<String, String> staticParams = {};
  static const String _cookies = "";
  final String apiUrl;
  final RequestTypeEnum requestType;
  static Map<String, String> staticHeaders = {};
  static ByteData? _pemCer;
  static ByteData? _keyCer;
  static String? _secretCer;
  static bool isDisconnect = false;
  Map<RequestTypeEnum, String> requestTypeMap = {
    RequestTypeEnum.put: "PUT",
    RequestTypeEnum.post: "POST",
    RequestTypeEnum.get: "GET",
    RequestTypeEnum.delete: "DELETE"
  };
  bool enableRe = true;
  ApiController(this.apiUrl, this.requestType);
  static init({
    required String baseUrl,
    required String serverErrorMessage,
    required String connectionErrorMessage,
    bool isCultureHeader = false,
    bool showConnectionListener = true,
  }) {
    ApiController.isCultureHeader = isCultureHeader;
    ApiController.baseUrl = baseUrl;
    ApiController.serverErrorMessage = serverErrorMessage;
    ApiController.connectErrorMessage = serverErrorMessage;
    if (showConnectionListener && !kIsWeb) internetConnectionListener();
  }

/*  static _addCookies(String key, String value) {
    _cookies += "$key=$value;";
  }*/

  Future<ApiResponse> sendRequest({
    Map<String, dynamic>? body,
    List<Map<String, dynamic>>? listBody,
    List<FileMultiPart> files = const [],
    bool isMultiPart = false,
    Map<String, String> header = const {},
    Map<String, dynamic> queryParameters = const {},
    String? optionalUrl,
    bool retry = false,
  }) async {
    if (!await hasConnection()) {
      throw LangEnum.noInternetConnection.toString().tr;
    }
    Map<String, String> finalQueryParams = {};
    if (authorization == null) await Auth._getDefaultAuthToken();
    ApiController.staticHeaders["theme"] = AppMode.getThemeMode().toString().replaceAll("ThemeMode.", "");
    ApiController.staticHeaders["Authorization-Token"] = authorization ?? "Not Auth";
    if (ApiController.isCultureHeader) {
      staticHeaders["culture"] = AppMode.getLanguageMode();
    } else {
      finalQueryParams["Culture"] = AppMode.getLanguageMode();
    }
    queryParameters.forEach((key, value) {
      finalQueryParams[key] = value.toString();
    });
    finalQueryParams.addAll(staticParams);

    if (_cookies.isNotEmpty) staticHeaders["Cookie"] = _cookies;
    staticHeaders.addAll(header);
    var requestData;
    if (isMultiPart) {
      requestData = FormData({});
      if (files.isNotEmpty) {
        await Future.forEach<FileMultiPart>(files, (file) async {
          var compressByte = kIsWeb ? file.platformFile.bytes : await compressFile(file.platformFile);
          var fileName = file.platformFile.name;
          var contentType =
          MediaType(lookupMimeType(file.platformFile.name) ?? "", "");
          requestData.files.add(MapEntry(file.key,
            MultipartFile.fromBytes(
                compressByte!,
                filename: fileName,
                contentType: contentType,
              )));
        });
      }
      if (listBody != null) {
        for (var element in listBody) {
          element.forEach((key, value) {
            fillMultiPart(requestData, key, value, "");
          });
        }
      } else {
        if (body != null) {
          body.forEach((key, value) {
            fillMultiPart(requestData, key, value, "");
          });
        }
      }

      if (!kReleaseMode && isMultiPart) {
        var printMultiPart = "";
        for (var element in (requestData as FormData).fields) {
          printMultiPart += "${element.key}:${element.value}\n";
        }
        if (kDebugMode) {
          print("MultiPart: $printMultiPart");
        }
      }
    } else {
      requestData = listBody ?? body;
    }
    var api = Dio(
      BaseOptions(
        baseUrl: optionalUrl ?? baseUrl,
        contentType: 'application/json; charset=UTF-8',
        responseType: ResponseType.json,
        headers: staticHeaders,
        connectTimeout: const Duration(milliseconds: 120000),
        extra: {
          "withCredentials": true,
        },
        method:
        requestType.toString().replaceAll("RequestTypeEnum.", ""),
      ),
    );

    if (!kIsWeb) {
      (api.httpClientAdapter as IOHttpClientAdapter).createHttpClient =
          () {
            final HttpClient client =
            HttpClient(context: SecurityContext(withTrustedRoots: false));
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };
    }

    if (_pemCer != null) {
      if (!kIsWeb) {
        (api.httpClientAdapter as IOHttpClientAdapter).createHttpClient =
            () {
          SecurityContext serverContext =  SecurityContext()
            ..useCertificateChainBytes(_pemCer!.buffer.asUint8List())
            ..usePrivateKeyBytes(_keyCer!.buffer.asUint8List(),
                password: _secretCer!);

          HttpClient httpClient = HttpClient(
            context: serverContext,
          );

          httpClient.badCertificateCallback =
              (X509Certificate cert, String host, int port) => true;

          return httpClient;
        };
      }
    }

    if (!kReleaseMode) {
      log("Request Body: ${jsonEncode(body)}");
    }

    api.interceptors.add(
      LogInterceptor(
        responseBody: !kReleaseMode,
        error: !kReleaseMode,
        request: !kReleaseMode,
        // requestBody: !kReleaseMode,
        requestHeader: !kReleaseMode,
        responseHeader: !kReleaseMode,
      ),
    );
    
    Response<dynamic>? response;
    try {
      response = await api.request(
        "$apiUrl?${_getQueryParams(finalQueryParams)}",
        data: requestData,
        options: Options(
          extra: {
            "withCredentials": true,
          },
          receiveDataWhenStatusError: true,
        ),
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    if ((response == null || response.statusCode == HttpStatus.unauthorized)) {
      if (enableRe && !retry) {
        enableRe = false;
        await Auth.reToken(retry);
      }
      response = await api
          .request(
        "$apiUrl?${_getQueryParams(finalQueryParams)}",
        data: requestData,
        options: Options(
          extra: {
            "withCredentials": true,
          },
          receiveDataWhenStatusError: true,
        ),
      )
          .onError((error, stackTrace) => throw error.toString());
    }
    enableRe = true;
    if (response.statusCode == HttpStatus.ok) {
      var commaDecode = "\\002C";
      if (response.headers.value("authorization") != null) {
        Auth._setBearerToken(
          token: response.headers
              .value("authorization")
              ?.replaceAll(commaDecode, ",") ??
              "",
          expiration: response.headers
              .value("expires")
              .toString()
              .replaceAll(commaDecode, ","),
        );
        await Auth._setRefreshToken(response.headers
            .value("Set-Refresh")
            ?.replaceAll(commaDecode, ",") ??
            "");
      }

      var apiResponse = ApiResponse();
      apiResponse.headers= response.headers;
      if (response.headers.value("x-status") != null) {
        apiResponse.setStatus(jsonDecode(
            response.headers.value("x-status")?.replaceAll(commaDecode, ",") ??
                ""));
      } else {
        /// for annymous apis
        apiResponse.success = true;
      }

      if (response.headers.value("x-pagination") != null) {
        apiResponse.pagination.hasPagination = true;
        apiResponse.pagination.set(jsonDecode(response.headers
            .value("x-pagination")
            .toString()
            .replaceAll(commaDecode, ",")));
      } else {
        apiResponse.pagination.hasPagination = false;
      }
      if (apiResponse.success) {
        apiResponse.objectResponse = response.data;
        return apiResponse;
      } else {
        throw utf8.decode(base64.decode(apiResponse.errorMessage));
      }
    } else {
      throw serverErrorMessage;
    }
  }

  void fillMultiPart(dynamic requestData, String key, dynamic value, String root) {
    if (value is Map) {
      for (var object in value.entries) {
        fillMultiPart(requestData, object.key, object.value, "$root$key.");
      }
    } else if (value is List) {
      for (int i = 0; i < value.length; i++) {
        fillMultiPart(requestData, "$key[$i]", value[i], root);
      }
    } else {
      requestData.fields.add(MapEntry("$root$key", value.toString()));
    }
  }

  String _getQueryParams(Map<String, dynamic> map) {
    String result = "";
    map.forEach((key, value) {
      result += "$key=${Uri.encodeComponent(value)}&";
    });
    return result;
  }

  Future<Uint8List?> compressFile(PlatformFile platformFile) async {
    /*  if (getx.GetUtils.isVideo(platformFile.path ?? "")) {
      MediaInfo? mediaInfo = await VideoCompress.compressVideo(
        platformFile.path ?? "",
        quality: VideoQuality.LowQuality,
      );
      return mediaInfo?.file?.readAsBytesSync();
    } else*/
    if (getx.GetUtils.isImage(platformFile.path ?? "")) {
      var result = await FlutterImageCompress.compressWithList(
        platformFile.bytes!,
        format: CompressFormat.png,
        minWidth: 500,
        minHeight: 500,
        quality: 70,
      );
      return result;
    } else {
      return platformFile.bytes;
    }
  }
}

class Auth {
  static final _expirationFormat = DateFormat("E, dd MMM yyy HH:mm:ss 'GMT'");

  static init({
    required String appSecret,
    required UserAgentEnum userAgent,
    required String apiKey,
    required String refreshTokenUrl,
    required String revokeTokenUrl,
    ByteData? pemCer,
    ByteData? keyCer,
    required String? secretCer,
  }) {
    ApiController.refreshTokenUrl = refreshTokenUrl;
    ApiController.revokeTokenUrl = revokeTokenUrl;
    ApiController.staticHeaders["Secret"] = appSecret;
    ApiController.staticHeaders["Api-Key"] = apiKey;
    ApiController.staticHeaders["User-Platform"] = userAgent.toString().replaceFirst("UserAgentEnum.", "");
    ApiController._pemCer = pemCer;
    ApiController._keyCer = keyCer;
    ApiController._secretCer = secretCer;
  }

  static _setBearerToken({
    required String token,
    required String expiration,
  }) async {
    const storage =  storage_secure.FlutterSecureStorage();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ApiController.authorization = token;
    if (!kIsWeb) {
      storage.write(key: "authorization-token", value: token);
    } else {
      prefs.setString("authorization-token", token);
    }

    ApiController.authorizationExpired = expiration;
    if (!kIsWeb) {
      storage.write(key: "authorization-timeout", value: expiration);
    } else {
      prefs.setString("authorization-timeout", expiration);
    }

    var expirationMin = _expirationFormat
        .parse(expiration)
        .difference(DateTime.now())
        .inMinutes -
        5;
    log("re in $expirationMin min");
  }

  static Future<void> _getDefaultAuthToken() async {
    String? expires;
    String? token;
    if (!kIsWeb) {
      const storage =  storage_secure.FlutterSecureStorage();
      try {
        expires = await storage.read(key: "authorization-timeout");
        token = await storage.read(key: "authorization-token");
      } catch (e) {
        log(e.toString());
      }
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      expires = prefs.getString("authorization-timeout");
      token = prefs.getString("authorization-token");
    }
    if (expires != null &&
        _expirationFormat.parse(expires).isAfter(DateTime.now())) {
      ApiController.authorization = token;
    }
  }

  static Future<ApiResponse?> reToken([bool retry = false]) async {
    String? expires;
    String? token;
    if (!kIsWeb) {
      const storage =  storage_secure.FlutterSecureStorage();
      try {
        expires = await storage.read(key: "Expires");
        token = await storage.read(key: "RefreshToken");
      } catch (e) {
        print(e);
      }
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      expires = prefs.getString("Expires");
      token = prefs.getString("RefreshToken");
      ApiController.refreshToken = token;
    }
    if (expires != null &&
        _expirationFormat.parse(expires).isAfter(DateTime.now())) {
      ApiResponse? apiResponse;

      await ApiController(ApiController.refreshTokenUrl ?? "",
          RequestTypeEnum.post)
          .sendRequest(body: {"Token": token ?? ""}, retry: !retry).then(
              (value) {
            apiResponse = value;
          }).onError((error, stackTrace) {
        throw error.toString();
      });
      return apiResponse;
    } else {
      return null;
    }
  }

  static Future<bool> clearToken({Map<String, String>? body}) async {
    ApiController.authorization = "";
    String? token;
    if (!kIsWeb) {
      const storage =  storage_secure.FlutterSecureStorage();
      try {
        token = await storage.read(key: "RefreshToken");
        await storage.delete(key: "RefreshToken");
      } catch (e) {
        print(e);
      }
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString("RefreshToken");
      await prefs.remove("RefreshToken");
    }

    bool isCleared = false;
    body?["Token"] = token ?? "";
    await ApiController(ApiController.revokeTokenUrl ?? "",
        RequestTypeEnum.post)
        .sendRequest(body: body)
        .then((value) {
      isCleared = true;
      if (ApiController.staticHeaders.containsKey("Authorization-Token")) {
        ApiController.staticHeaders.remove("Authorization-Token");
      }

      if (!kIsWeb) {
        const storage =  storage_secure.FlutterSecureStorage();
        storage.deleteAll();
      } else {
        SharedPreferences.getInstance().then((value) => value.clear());
      }
    }).onError((error, stackTrace) {
      isCleared = false;
    });
    return isCleared;
  }

  static _setRefreshToken(String refreshToken) async {
    ApiController.refreshToken = refreshToken;
    const storage =  storage_secure.FlutterSecureStorage();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> json = jsonDecode(refreshToken);
    ApiController.refreshToken = json["RefreshToken"];
    json.forEach((key, value) {
      if (!kIsWeb) {
        storage.write(key: key, value: value);
      } else {
        prefs.setString(key, value);
      }
    });
  }
}
