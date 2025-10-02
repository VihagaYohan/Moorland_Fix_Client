import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:moorland_fix/app/features/auth/data/data_sources/data_source.dart';
// shared
import 'package:moorland_fix/app/shared/index.dart';

// exceptions
import '../exceptions/_index.dart';
// model
import '../models/user_model.dart';

class AuthRemoteImpl implements DataSource {
  final GoogleSignIn _googleSignIn;
  FirebaseFirestore dbInstance;

  AuthRemoteImpl({GoogleSignIn? googleSignIn, required this.dbInstance})
    : _googleSignIn = googleSignIn ?? GoogleSignIn();

  @override
  Future<Result<UserModel>> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return Result.failure(SignInException("Sign in cancelled"));
      }

      final String email = googleUser.email;

      // check firestore admins collections for this email
      final QuerySnapshot snapshot = await dbInstance.collection(Collections.admins)
      .where('email', isEqualTo: email)
      .get();

      if(snapshot.docs.isNotEmpty) {
        // email found in admins collection
        final storage = await EncryptStorage.create();
        await storage.setValue<bool>(Constants.isAdminKey, true);
      }

      return Result.success(
        UserModel(
          uid: googleUser.id,
          name: googleUser.displayName ?? "",
          email: googleUser.email,
          photoUrl: googleUser.photoUrl ?? "",
          isAdmin: snapshot.docs.isNotEmpty,
        ),
      );
    } catch (e) {
      return Result.failure(
        SignInException("Unknown error at sign in ${e.toString()}"),
      );
    }
  }

  @override
  Future<Result<void>> signOut() {
    throw UnimplementedError();
  }
}
