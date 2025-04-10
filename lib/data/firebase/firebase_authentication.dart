import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flix_id/data/repositories/authentication.dart';
import 'package:flix_id/domain/entities/result.dart';

class FirebaseAuthentication implements Authentication{
  final firebase_auth.FirebaseAuth _firebaseAuth;

  FirebaseAuthentication({firebase_auth.FirebaseAuth? firebaseAuth}) : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;
  @override
  String? getLoggedInUser() => _firebaseAuth.currentUser?.uid;

  @override
  Future<Result<String>> login({required String email, required String password}) async {
    try {
        var userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
        
        return Result.success(userCredential.user!.uid);
    } on firebase_auth.FirebaseAuthException catch (e) {
        return Result.failed(e.message!);
    }
  }

  @override
  Future<Result<void>> logout() async {
    await _firebaseAuth.signOut();
    if(_firebaseAuth.currentUser == null){
      return Result.success(null);
    } else {
      return Result.failed('Logout Failed')
    }
  }

  @override
  Future<Result<String>> register({required String email, required String password}) async {
    try{
      var userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return Result.success(userCredential.user!.uid);
    }
    on firebase_auth.FirebaseAuthException catch (e){
      return Result.failed('${e.message}');
    }
  }

}
