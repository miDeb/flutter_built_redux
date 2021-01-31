library test_models;

import 'package:built_value/built_value.dart';
import 'package:built_redux/built_redux.dart';

part 'test_models.g.dart';

Store<Counter, CounterBuilder, CounterActions> createStore() => new Store(
      createReducer(),
      new Counter(),
      new CounterActions(),
    );

Reducer<Counter, CounterBuilder, dynamic> createReducer() =>
    (new ReducerBuilder<Counter, CounterBuilder>()
          ..add(CounterActionsNames.increment, (s, a, b) => b.count = b.count! + 1)
          ..add(CounterActionsNames.incrementOther, (s, a, b) => b.other= b.other! + 1))
        .build();

abstract class CounterActions extends ReduxActions {
  factory CounterActions() => new _$CounterActions();
  CounterActions._();

  VoidActionDispatcher get increment;
  VoidActionDispatcher get incrementOther;
}

abstract class Counter implements Built<Counter, CounterBuilder> {
  factory Counter() => new _$Counter._(
        count: 0,
        other: 0,
      );
  Counter._();

  int get count;
  int get other;
}
