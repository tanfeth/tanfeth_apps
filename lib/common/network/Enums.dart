import 'enumeration.dart';

class HttpMethod extends NetworkEnum {
  HttpMethod(value) : super(value);
  static final HttpMethod GET = HttpMethod('GET');
  static final HttpMethod POST = HttpMethod('POST');
  static final HttpMethod DELETE = HttpMethod('DELETE');
  static final HttpMethod PUT = HttpMethod('PUT');
}

class NetworkStatusCodes extends NetworkEnum {
  NetworkStatusCodes(value) : super(value);

  static final unAuthorizedUser = NetworkStatusCodes(401);
  static final badRequest = NetworkStatusCodes(400);
  static final serverInternalError = NetworkStatusCodes(500);
  static final oK_200 = NetworkStatusCodes(200);
}

class ContractTypes extends NetworkEnum {
  ContractTypes(value) : super(value);

  static final individuals = ContractTypes(230);
  static final companies = ContractTypes(231);
}

class ContractModes extends NetworkEnum {
  ContractModes(value) : super(value);

  static final contractMode = ContractModes(240);
}

class ContractStatus extends NetworkEnum {
  ContractStatus(value) : super(value);
  static final open = ContractStatus(210);
  static final close = ContractStatus(211);
  static final inDebt = ContractStatus(311);
  static final cancelled = ContractStatus(212);
}

class VoucherOperationType extends NetworkEnum {
  VoucherOperationType(value) : super(value);
  static final addContract = VoucherOperationType(2300);
  static final extendContract = VoucherOperationType(2301);
  static final contractPayment = VoucherOperationType(2302);
  static final closeContract = VoucherOperationType(2303);
  static final viewContract = VoucherOperationType(2304);
  static final switchVehicle = VoucherOperationType(2305);
  static final addBooking = VoucherOperationType(2306);
  static final editBooking = VoucherOperationType(2307);
  static final executeBooking = VoucherOperationType(2308);
  static final cancelBooking = VoucherOperationType(2309);
  static final bookingPayment = VoucherOperationType(2310);
  static final refund = VoucherOperationType(2311);
  static final cancelContract = VoucherOperationType(2312);
}

class Sources extends NetworkEnum {
  Sources(id) : super(id);
  static final backOfficeSource = Sources(120);
  static final androidSource = Sources(121);
  static final iosSource = Sources(122);
}

class ECheckType extends NetworkEnum {
  ECheckType(type) : super(type);

  static final openContract = ECheckType(1);
  static final closeContract = ECheckType(2);
}

class VoucherTypeIds extends NetworkEnum {
  VoucherTypeIds(id) : super(id);
  static final addPayment = VoucherTypeIds(270);
  static final disbursement = VoucherTypeIds(271);
}

class OperationTypes extends NetworkEnum {
  OperationTypes(id) : super(id);

  static final openContract = OperationTypes(1800);
  static final closeContract = OperationTypes(1803);
}

class BranchesTypes extends NetworkEnum {
  BranchesTypes(typeId) : super(typeId);

  static final rentalBranch = BranchesTypes(8900);
}
