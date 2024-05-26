
import 'package:tanfeth_apps/common/network/network/api/api_response.dart';

class PaginationModel<T> {
  PaginationModel(
      {required this.pagination, required this.response, this.paramJson});
  final Pagination pagination;
  final Map<String, dynamic>? paramJson;
  final T response;
}
