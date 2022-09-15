import 'package:test/test.dart';

class Counter {
  int value = 0;
  void increment() => value++;

  void decrement() => value--;
}

class Person {
  var personlist = [];

  void add_to_list() => personlist.addAll(["thing1", "thing2"]);
}

void main() {
  test('counter should increment', () {
    final counter = Counter();
    counter.increment();
    expect(counter.value, 1);
  });

  test('list size should be > 0', () {
    final person = Person();
    person.add_to_list();
    expect(person.personlist.length, greaterThan(0));
  });
}
