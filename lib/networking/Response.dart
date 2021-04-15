class Response<T> {
  Status status;
  T data;
  String message;

  Response.loading(this.message) : status = Status.LOADING;
  Response.complete(this.data) : status = Status.COMPLETE;
  Response.error(this.message) : status = Status.ERROR;
}

enum Status {
  LOADING,
  COMPLETE,
  ERROR,
}
