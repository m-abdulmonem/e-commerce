abstract class IAuthRepository {

  Future singIn({String? phone, String? password});

  Future<void> singUp({String? phone, String? password});

  Future<void> forgetPassword({String? auth,bool? isEmail});

  Future resetPassword({String? auth,bool? isEmail});


  Future<void> loginWithFacebook();

  Future<void> loginWithGoogle();


  Future<void> signOut();
}
