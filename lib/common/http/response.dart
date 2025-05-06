// ignore_for_file: constant_identifier_names

class DataResponse<T> {
  Status status;
  T? data;
  String? message;
  String? modelType;
  int? statusCode;

  DataResponse.loading(this.message) : status = Status.Loading;

  DataResponse.success(this.data, {this.modelType}) : status = Status.Success;

  DataResponse.error(this.message, [this.statusCode]) : status = Status.Error;

  DataResponse.connectivityError() : status = Status.ConnectivityError;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum Status { Loading, Success, Error, ConnectivityError }
