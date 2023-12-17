

import 'dart:convert';

MapEntry<dynamic, dynamic> transform(String key, dynamic value) {
  // Your transformation logic here
  return MapEntry(key, value);
}

List<MapEntry<dynamic, dynamic>> areaModelFromJson(dynamic str) =>
    (str as Map<String, dynamic>).entries.map((entry) => transform(entry.key, entry.value)).toList();


class AreaModel {
  int? success;
  String? message;
  List<CoverageAreas>? coverageAreas;

  AreaModel({this.success, this.message, this.coverageAreas});

  AreaModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['coverage_areas'] != null) {
      coverageAreas = <CoverageAreas>
      [
      ];
      json['coverage_areas'].forEach((v) {
        coverageAreas!.add(new CoverageAreas.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.coverageAreas != null) {
      data['coverage_areas'] =
          this.coverageAreas!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CoverageAreas {
  int ?id;
  String? coverageArea;
  String? postCode;
  String? districtName;
  String? serviceAreaName;
  int? codCharge;

  CoverageAreas(
      {this.id,
      this.coverageArea,
      this.postCode,
      this.districtName,
      this.serviceAreaName,
      this.codCharge});

  CoverageAreas.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    coverageArea = json['coverage_area'];
    postCode = json['post_code'];
    districtName = json['district_name'];
    serviceAreaName = json['service_area_name'];
    codCharge = json['cod_charge'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['coverage_area'] = this.coverageArea;
    data['post_code'] = this.postCode;
    data['district_name'] = this.districtName;
    data['service_area_name'] = this.serviceAreaName;
    data['cod_charge'] = this.codCharge;
    return data;
  }
}
