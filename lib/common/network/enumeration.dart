abstract class NetworkEnum<T> {
  final T _value;

  const NetworkEnum(this._value);

  T get value => _value;
}
