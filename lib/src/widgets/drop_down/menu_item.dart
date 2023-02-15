part of 'ga_drop_down.dart';

/// This class need [T] type model name and value
class MenuItem<T> {
  final T model;
  final String value;

  MenuItem({required this.model, required this.value});

  @override
  String toString() => 'MenuItem(model: $model, value: $value)';
}
