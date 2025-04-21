import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:nav/cubit/swapi_cubit.dart";


class SwapiPage extends StatefulWidget {
  const SwapiPage({super.key});

  @override
  State<SwapiPage> createState() => _SwapiPageState();
}

class _SwapiPageState extends State<SwapiPage> {
  final TextEditingController _idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwapiCubit, SwapiState>(
      builder: (context, state) {
        final cubit = context.read<SwapiCubit>();
        final state = cubit.state;

        return Scaffold(
          appBar: AppBar(title: const Text("Swapi Page")),
          body: Column(
            children: [
              TextFormField(controller: _idController,
                  decoration: const InputDecoration(labelText: "ID"),
              ),
              ElevatedButton(
                child: const Text("Fetch Person"),
                onPressed: () {
                  final cubit = context.read<SwapiCubit>();
                  final id = int.tryParse(_idController.text);

                  if (id == null) {
                    cubit.emitError("Please enter a valid number.");
                  } else if (id < 1 || id > 82) {
                    cubit.emitError("ID must be between 1 and 82.");
                  } else {
                    cubit.fetchPerson(id);
                  }
                },
              ),
              Builder(
                builder: (context) {
                  if (state is SwapiStateSuccess) {
                    return Column(
                      children: [
                        Text("ID: ${state.id}"),
                        Text("Name: ${state.name}"),
                        Text("Gender: ${state.gender}"),
                        Text("Eye Color: ${state.eyeColor}"),
                        Text("Hair Color: ${state.hairColor}"),
                        Text("Height: ${state.height}"),
                        Text("Birth Year: ${state.birthYear}"),
                      ],
                    );
                  } else if (state is SwapiStateError) {
                    return Text("${state.error}",
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  } else if (state is SwapiStateLoading) {
                    return const CircularProgressIndicator();
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
