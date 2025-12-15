import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_form_using_bloc/welcome.dart';
import 'login/login_bloc.dart';
import 'login/login_event.dart';
import 'login/login_state.dart';

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(),
      child: Scaffold(
        appBar: AppBar(title: Text("Login")),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state.issuccess) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => WelcomePage()),
                );
              }

              if (state.errorMessage != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.errorMessage!)),
                );
              }
            },
            builder: (context, state) {
              return Column(
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: "Email"),
                    onChanged: (value) {
                      context.read<LoginBloc>().add(EmailChanged(value));
                    },
                  ),

                  SizedBox(height: 20),

                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(labelText: "Password"),
                    onChanged: (value) {
                      context.read<LoginBloc>().add(PasswordChanged(value));
                    },
                  ),

                  SizedBox(height: 30),

                  state.isloading
                      ? CircularProgressIndicator()
                      : ElevatedButton(
                    onPressed: () {
                      context.read<LoginBloc>().add(LoginSubmitted());
                    },
                    child: Text("Login"),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
