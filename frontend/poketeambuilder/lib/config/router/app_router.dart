import '/ui/screens/home.dart';
import '/ui/screens/team.dart';
import '/ui/screens/community.dart';
import '/ui/screens/profile.dart';
import '/ui/screens/signin.dart';

final appRouter = {
  '/home': (context) => const Home(),
  '/team': (context) => const Team(),
  '/community': (context) => const Community(),
  '/profile': (context) => const Profile(),
  '/signin': (context) => const SignIn(),
  '/register': (context) => const Profile(),
};
