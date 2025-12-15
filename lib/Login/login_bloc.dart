import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent,LoginState>{
  LoginBloc (): super(LoginState()){
    on<EmailChanged>((event,emit){
      emit(state.copyWith(email: event.email));
  });
    on<PasswordChanged>((event,emit){
      emit(state.copyWith(password:event.password));
    });
    on<LoginSubmitted>((event,emit)async{
      emit(state.copyWith(isloading:true));
      await Future.delayed(Duration(seconds: 1));

      if(state.email=="admin@gmail.com" && state.password=="12345") {
        emit(state.copyWith(
            isloading: false,
            issuccess: true
        ));
      }
          else{
            emit(state.copyWith(
              isloading: false,
              errorMessage: "Invalid Input"
            ));
      }
      });
  }
}