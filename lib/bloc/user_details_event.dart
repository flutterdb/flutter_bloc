
abstract class UserDetailsEvent{
  const UserDetailsEvent();
}

class FetchUserDetailsEvent extends UserDetailsEvent{
  final int userId;
  FetchUserDetailsEvent(this.userId);
}