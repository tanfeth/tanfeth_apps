import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart';
import 'package:tanfeth_apps/common/network/Enums.dart';
import 'package:tanfeth_apps/common/network/network/client/ApiClient.dart';

class NetworkCall {
  static Future<Map<String, dynamic>> makeCall({
    String? endPoint,
    HttpMethod? method,
    dynamic requestBody,
    Map<String, dynamic>? queryParams,
    bool isMultipart = false,
    List<MultipartFile>? filesMap,
  }) async {
    // var connectivityResult = await (Connectivity().checkConnectivity());
    // if (connectivityResult == ConnectivityResult.none) {
    //   // User not connected to the internet.
    //
    //   return Future.error('No internet connection');
    // }
    try {
      Response response;

      if (method == HttpMethod.PUT) {
        response = (await ApiClient.putRequest(
          endPoint!,
          requestBody,
          isMultipart: isMultipart,
          multiPartValues: filesMap,
        ));
      } else if (method == HttpMethod.DELETE) {
        response = (await ApiClient.deleteRequest(endPoint!, queryParams: queryParams));
      } else if (method == HttpMethod.GET) {
        response = (await ApiClient.getRequest(endPoint ?? '', queryParams: queryParams));
      } else {
        response = (await ApiClient.postRequest(
          endPoint!,
          requestBody,
          isMultipart: isMultipart,
          filesMap: filesMap,
        ));
      }

      if (response.statusCode == NetworkStatusCodes.oK_200.value) {
        //Api logger
        // void prettyPrintJson(String input) {
        //   const JsonDecoder decoder = JsonDecoder();
        //   const JsonEncoder encoder = JsonEncoder.withIndent('   ');
        //   final dynamic object = decoder.convert(input);
        //   final dynamic prettyString = encoder.convert(object);
        //   prettyString.split('\n').forEach((dynamic element) => print(element));
        // }
        // prettyPrintJson(response.body);
        log("Api Response [$endPoint] : ${response.body}");
        return jsonDecode(response.body);
      } else if (response.statusCode == NetworkStatusCodes.serverInternalError.value ||
          response.statusCode == NetworkStatusCodes.badRequest.value) {
        //Api logger
        //log("API Error: ${response.statusCode} - ${response.reasonPhrase} - ${response.body}");
        log("API Error [$endPoint] : ${response.body}");

        return jsonDecode(response.body);
      } else if (response.statusCode == NetworkStatusCodes.unAuthorizedUser.value) {
        log("API Error [$endPoint] : ${response.body}");

        return jsonDecode(response.body);
        // var result = jsonDecode(response.body) as Map<String, dynamic>;
        // result['error']['code'] = response.statusCode;
        //
        // //Api logger
        // log("API Error: ${response.statusCode} - ${response.reasonPhrase} - $result");
        // return result;
      } else {
        //Api logger
        log("API Error [$endPoint] : ${response.statusCode} - ${response.reasonPhrase} - ${response.body}");
        // return {
        //   "success": false,
        //   "error": {
        //     "code": response.statusCode,
        //     "message": response.reasonPhrase,
        //     "details": ""
        //   }
        // };
        return jsonDecode(response.body);
      }
    } on SocketException catch (_) {
      return {
        "success": false,
        "error": {"code": 0, "message": "No internet connection, please check you network and try again", "details": ""}
      };
    }
  }
}
