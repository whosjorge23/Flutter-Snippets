import 'package:flutter_bloc/flutter_bloc.dart';

// Definisci uno stato per il tuo Cubit
class CounterState {
  final int count;

  CounterState(this.count);
}

// Crea il tuo Cubit estendendo la classe Cubit
class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(0));

  // Aggiungi metodi per effettuare le operazioni sullo stato
  void increment() {
    emit(CounterState(state.count + 1));
  }

  void decrement() {
    emit(CounterState(state.count - 1));
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      home: BlocProvider(
        // Fornisci il tuo Cubit al widget BlocProvider
        create: (context) => CounterCubit(),
        child: CounterPage(),
      ),
    );
  }
}

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Accedi al tuo Cubit utilizzando il widget BlocBuilder
    return Scaffold(
      appBar: AppBar(title: Text('Counter App')),
      body: BlocBuilder<CounterCubit, CounterState>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Count:', style: TextStyle(fontSize: 24)),
                Text('${state.count}', style: TextStyle(fontSize: 48)),
              ],
            ),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              // Utilizza il metodo del Cubit per incrementare il contatore
              context.read<CounterCubit>().increment();
            },
            child: Icon(Icons.add),
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {
              // Utilizza il metodo del Cubit per decrementare il contatore
              context.read<CounterCubit>().decrement();
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
