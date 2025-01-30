import 'package:bloc/bloc.dart';
import 'package:bloc_learning/bloc/login_bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc _loginBloc;
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _loginBloc = LoginBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: BlocProvider(
        create: (_) => _loginBloc,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlocBuilder<LoginBloc, LoginState>(
                buildWhen: (current, previous) =>
                    current.email != previous.email,
                builder: (context, state) {
                  return TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    focusNode: emailFocusNode,
                    decoration: InputDecoration(
                        hintText: 'Email', border: OutlineInputBorder()),
                    onChanged: (value) {
                      context.read<LoginBloc>().add(
                            EmailChanged(email: value),
                          );
                    },
                    onFieldSubmitted: (value) {},
                  );
                },
              ),
              SizedBox(
                height: 25,
              ),
              BlocBuilder<LoginBloc, LoginState>(
                buildWhen: (current, previous) =>
                    current.password != previous.password,
                builder: (context, state) {
                  return TextFormField(
                    keyboardType: TextInputType.text,
                    focusNode: passwordFocusNode,
                    decoration: InputDecoration(
                        hintText: 'Password', border: OutlineInputBorder()),
                    onChanged: (value) {
                      context.read<LoginBloc>().add(
                            PasswordChanged(
                              password: value,
                            ),
                          );
                    },
                    onFieldSubmitted: (value) {},
                  );
                },
              ),
              SizedBox(
                height: 50,
              ),
              BlocListener<LoginBloc, LoginState>(
                listener: (context, state) {
                  if (state.loginStatus == LoginStatus.error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Error"),
                      ),
                    );
                  }
                  if(state.loginStatus == LoginStatus.loading){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Submitting"),
                      ),
                    );
                  }
                  if(state.loginStatus == LoginStatus.success){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Its success"),
                      ),
                    );
                  }
                },
                child: BlocBuilder<LoginBloc, LoginState>(
                  buildWhen: (current, previous) => false,
                  builder: (context, state) {
                    return ElevatedButton(
                        onPressed: () {
                          context.read<LoginBloc>().add(LoginApi());
                        },
                        child: Text("Login"));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
