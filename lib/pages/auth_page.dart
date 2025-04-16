import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:nav/cubit/auth_cubit.dart";
import "package:nav/utils/build_context_extensions.dart";

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, count) {
        final cubit = context.read<AuthCubit>();
        final state = cubit.state;

        return Scaffold(
          appBar: AppBar(title: const Text("Auth Page")),
          body: Column(
            children: [
              TextFormField(controller: _emailController, decoration: const InputDecoration(labelText: "Email")),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: "Password"),
                obscureText: true,
              ),
              Text(context.read<AuthCubit>().state.toString(), style: context.theme.textTheme.displayLarge),
              Builder(
                builder: (context) {
                  if (state is AuthStateSuccess) {
                    return Text(
                      "${state.id} ${state.displayName}",
                      style: context.theme.textTheme.headlineLarge!.copyWith(color: Colors.green),
                    );
                  } else if (state is AuthStateError) {
                    return Text(
                      "${state.error}",
                      style: context.theme.textTheme.headlineLarge!.copyWith(color: Colors.red),
                    );
                  } else if (state is AuthStateLoading) {
                    return const CircularProgressIndicator();
                  }

                  return const SizedBox.shrink();
                },
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<AuthCubit>().signIn(_emailController.text, _passwordController.text);
                },
                child: const Text("Sign In"),
              ),
            ],
          ),
        );
      },
    );
  }
}
