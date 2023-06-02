class GetIt {
  GetIt._();

  static final _instance = GetIt._();

  static GetIt get instance => _instance;

  singelton(Object object) {
    _singeltons.add(object);
  }

  T get<T>() {
    for (Object object in _singeltons) {
      if (object is T) {
        return object as T;
      }
    }

    throw Exception("$T has not");
  }

  static final List<Object> _singeltons = [];
}
