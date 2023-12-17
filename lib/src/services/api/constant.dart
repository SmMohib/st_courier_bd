// ignore_for_file: non_constant_identifier_names, constant_identifier_names
class ApiEndPoints {
  static final String baseUrl = 'http://restapi.adequateshop.com/api/';
  static _AuthEndPoints authEndpoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String registerEmail = 'authaccount/registration';
  final String loginEmail = 'authaccount/login';
}

/////
class ApiConstants {
  static String baseUrl = 'https://stcourier.softwaresale.xyz/';
  //https://dummyjson.com/products
  //https://stcourier.softwaresale.xyz/api/getMerchantUpazilaWeightPackageCODAndCharge


  static const String MERCHANT_DASHBOARD_URI = 'api/merchant/dashboard';
  static const String MERCHANT_PROFILE = 'api/merchant';
  static const String UPAZILA_WEIGHT_COD_URI =
      'api/getMerchantUpazilaWeightPackageCODAndCharge';
  static const String DISTRICT_URI = 'api/getDistricts';
  static const String AREA_URI = 'api/getAreas';
  static const String UPAZILLA_URI = 'api/getUpazilas';
  static const String ADD_PARCEL_URI = 'api/merchant/addParcel';

  static const String COVERAGE_AREA_URI = 'api/getServiceAreas';
  static const String GET_PARCEL_LIST_URI = 'api/merchant/getParcelList';
  static const String GET_PARCEL_DETAILS_URI = 'api/merchant/viewParcel';
  static const String FILTER_PARCEL_LIST_URI = 'api/merchant/filterParcelList';
  static const String ORDER_TRACK_URI = 'api/merchant/getOrderTrackingResult';
  static const String PAYMENT_REQ_LIST_URI =
      'api/merchant/getParcelPaymentRequestList';
  static const String PAYMENT_LIST_URI = 'api/merchant/getDeliveryPaymentList';
  static const String PAYMENT_LIST_VIEW_URI = 'api/merchant/getDeliveryPayment';
  static const String DELIVERY_PARCEL_LIST_URI =
      'api/merchant/getParcelPaymentList';
  static const String MARCHENT_PROFILE_EDIT_URI = 'api/merchant/profileUpdate';
  static const String MAKEPAYMENT_REQ_VIEW_URI =
      'api/merchant/paymentRequestGenerate';
  static const String MAKEPAYMENT_REQ_SUBMIT_URI =
      'api/merchant/confirmPaymentRequestGenerate';
  static const String ACCEPT_BUTTON_URI = 'api/merchant/parcel/';
  static const String HOLD_PARCEL_URI = 'api/merchant/parcelHold';
  static const String CANCEL_PARCEL_URI = 'api/merchant/parcelCancel';
  static const String PLAY_URI = 'api/merchant/parcelStart';
}
