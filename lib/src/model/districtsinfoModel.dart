class DistrictsinfoModel {
  int? success;
  String? message;
  List<Districts>? districts;
///https://stcourier.softwaresale.xyz/api/getDistricts
  DistrictsinfoModel({this.success, this.message, this.districts});

  DistrictsinfoModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['districts'] != null) {
      districts = <Districts>[];
      json['districts'].forEach((v) {
        districts!.add(new Districts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.districts != null) {
      data['districts'] = this.districts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Districts {
  int? id;
  String? name;
  int? serviceAreaId;
  int? homeDelivery;
  int? lockDownService;
  int? status;

  Districts(
      {this.id,
      this.name,
      this.serviceAreaId,
      this.homeDelivery,
      this.lockDownService,
      this.status});

  Districts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    serviceAreaId = json['service_area_id'];
    homeDelivery = json['home_delivery'];
    lockDownService = json['lock_down_service'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['service_area_id'] = this.serviceAreaId;
    data['home_delivery'] = this.homeDelivery;
    data['lock_down_service'] = this.lockDownService;
    data['status'] = this.status;
    return data;
  }
}
