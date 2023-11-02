// import 'package:flutter/cupertino.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:get_it/get_it.dart';
// import 'package:myapp/features/schets/repository/abstractSchetRepository.dart';

// import '../../../../generated/schet.pb.dart';
// // import '../../services/schet.pb.dart';

// // import '../../services/schet.pb.dart';

// part 'user_list_state.dart';
// part 'user_list_event.dart';

// class UserListBloc extends Bloc<UserListEvent, UserListState> {

//   // ФИКС
//   // UserListBloc(this.schetRepository, this.filterSchet)
//   UserListBloc()
//       : super(UserListInitial()) {
    
//     on<LoadUsers>((event, emit) async {
//       if (event.init) {
//         emit(UserListInitial());
//       } else {
//         emit(UserListLoading());
//       }
      
      
//       debugPrint('event' + event.toString());

//       var request = new UserListRequest();
//       request.firstName = event.name;
//       request.skip = event.skip;
//       request.take = event.take;

//       // ФИКС
//       // request.filter = filterSchet = event.filterSchet;
//       request.filter = event.filterSchet;

//       // debugPrint(event.toString());

//       var _result = await GetIt.I<AbstractSchetRepository>().GetUsers(request);
//       // debugPrint(_result.toString());
//       if (_result.succsecced) {
//         debugPrint('users2');
//         // debugPrint(_result.toString());
//         // filterSchet.skip += 20;
//         request.take += 20;
//         // event.link = _result.users;
//         emit(UserListSuccessed(
//             users: _result.users ,
//             ));
//             // totalCount: _result.count
//       } else {
//         emit(UserListFailure(
//             errorMessage: 'Не удалось получить данные с сервера'));
//       }
//     });
//   }

//   // ФИКС
//   // final AbstractSchetRepository schetRepository;
//   // FilterSchet filterSchet;
// }
