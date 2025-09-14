class Result<T> {
  final T? data;
  final Exception? error;
  final bool isSuccess;

  Result.success(this.data)
    : error = null,
  isSuccess = true;

  Result.failure (this.error) : data = null,  isSuccess = false;

  bool get isError => !isSuccess;

  void fold({
    required Function(T data)onSuccess,
    required Function(Exception error) onError,
}) {
    if(isSuccess) {
      onSuccess(data as T);
    } else {
      onError(error!);
    }
  }
}