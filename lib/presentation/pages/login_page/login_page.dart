import 'package:flix_id/presentation/extensions/build_context_extension.dart';
import 'package:flix_id/presentation/providers/router/router_provider.dart';
import 'package:flix_id/presentation/providers/user_data/user_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(userDataProvider, (previous, next){
      if(next is AsyncData){
        if(next.value != null){
          ref.read(routerProvider).goNamed('main');
        }
      } else if (next is AsyncError) {
        context.showSnackBar(next.error.toString());
      }
    },);

    return Scaffold(
      appBar: AppBar(title: const Text('Login'),),
      body: Center(
        child: ElevatedButton(onPressed: (){
          ref
            .read(userDataProvider.notifier)
            .login(email: 'rizal@rizal.com', password: '123456');
          // Login login = ref.watch(loginProvider);

          // login(LoginParams(email: 'rizal@rizal.com', password: '123456')).then((result) {
          //   if (result.isSuccess) {
          //     Navigator.of(context).push(MaterialPageRoute(
          //       builder: (context) => MainPage(user: result.resultValue!)
          //     ));
          //   } else {
          //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //       content: Text(result.errorMessage!)
          //     ));
          //   }
          // });
        }, child: const Text('Login'),),
      ),
    );
  }

  
  
}