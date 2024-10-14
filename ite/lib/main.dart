import 'package:flutter/material.dart';
import 'package:ite/core/utils/colors.dart';
import 'package:ite/core/utils/serves_locator.dart';
import 'package:ite/features/authentication/presentation/view%20models/doctor%20login/doctor_login_cubit.dart';
import 'package:ite/features/authentication/presentation/view%20models/student%20register/student_register_cubit.dart';
import 'package:ite/features/dactors%20schedule/data/repos/doctor_repo_impl.dart';
import 'package:ite/features/dactors%20schedule/presentation/view%20models/addnote/addnote_cubit.dart';
import 'package:ite/features/dactors%20schedule/presentation/view%20models/control%20all%20appointment/controlallappointment_cubit.dart';
import 'package:ite/features/dactors%20schedule/presentation/view%20models/control%20appointment/controlappointment_cubit.dart';
import 'package:ite/features/dactors%20schedule/presentation/view%20models/get%20my%20appointment/get_my_appointment_cubit.dart';
import 'package:ite/features/dactors%20schedule/presentation/view%20models/get%20notes/getnotes_cubit.dart';
import 'package:ite/features/dactors%20schedule/presentation/view%20models/get%20program/get_program_cubit.dart';
import 'package:ite/features/doctor%20files/presentation/view%20model/delete%20file/delete_file_cubit.dart';
import 'package:ite/features/doctor%20files/presentation/view%20model/get%20myfile/get_myfile_cubit.dart';
import 'package:ite/features/doctors%20labs/data/repos/lab_repo_impl.dart';
import 'package:ite/features/doctors%20labs/presentation/view%20model/add%20complaint/add_complaint_cubit.dart';
import 'package:ite/features/doctors%20labs/presentation/view%20model/add%20reserve/add_reserve_cubit.dart';
import 'package:ite/features/doctors%20labs/presentation/view%20model/get%20available%20place/get_available_place_cubit.dart';
import 'package:ite/features/doctors%20labs/presentation/view%20model/get%20halls/get_halls_cubit.dart';
import 'package:ite/features/doctors%20labs/presentation/view%20model/get%20labs/get_labs_cubit.dart';
import 'package:ite/features/doctors%20labs/presentation/view%20model/get%20reserves/get_reserves_cubit.dart';
import 'package:ite/features/groups/data/repos/group%20repo/group_repo_impl.dart';
import 'package:ite/features/groups/presentation/view%20models/create%20group%20cubit/create_group_cubit.dart';
import 'package:ite/features/groups/presentation/view%20models/get%20mygroup%20cubit/get_mygroup_cubit.dart';
import 'package:ite/features/authentication/data/repos/doctor%20repo/doctor_repo_impl.dart';
import 'package:ite/features/authentication/presentation/view%20models/doctor_auth/doctor_auth_cubit.dart';
import 'package:ite/features/authentication/presentation/views/login_page.dart';
import 'package:ite/features/student%20files/data/repo/file_repo_impl.dart';
import 'package:ite/features/student%20files/presentation/view%20model/get%20files/getfiles_cubit.dart';
import 'package:ite/features/student%20schedule/data/repos/appointment_repo_impl.dart';
import 'package:ite/features/student%20schedule/presentation/view%20models/add%20appointement/creat_appointment_cubit.dart';
import 'package:ite/features/student%20schedule/presentation/view%20models/get%20appointment/getappointment_cubit.dart';
import 'package:ite/features/student%20schedule/presentation/view%20models/get%20doctors/getdoctors_cubit.dart';
import 'dart:ui' as ui;
import 'package:ite/features/doctor%20files/data/repo/file_repo_impl.dart'
    as dfile;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:ite/features/student%20transactions/data/repo/transactionrepoimpl.dart';
import 'package:ite/features/student%20transactions/presentation/view%20model/add%20transaction/add_transaction_cubit.dart';
import 'package:ite/features/student%20transactions/presentation/view%20model/edite%20transaction/edite_transaction_cubit.dart';
import 'package:ite/features/student%20transactions/presentation/view%20model/get%20transaction/gettransaction_cubit.dart';

void main() {
  setup();
  initializeDateFormatting();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedPage = 0;
  // final _pages = [
  //   ShowLabs(),
  //   Appointments(),
  //   StudentAppointment(),
  //   StudentTransactions(),
  //   ProfilePage(),
  //   Groups(),
  // ];

  @override
  Widget build(BuildContext context) {
    // final doctorLoginCubit = BlocProvider.of<DoctorLoginCubit>(context);

    // const List<TabItem> items = [
    //   TabItem(
    //     icon: Icons.home,
    //     title: 'Home',
    //   ),
    //   TabItem(
    //     icon: Icons.search_sharp,
    //     title: 'Shop',
    //   ),
    //   TabItem(
    //     icon: Icons.favorite_border,
    //     title: 'Wishlist',
    //   ),
    //   TabItem(
    //     icon: Icons.shopping_cart_outlined,
    //     title: 'Cart',
    //   ),
    //   TabItem(
    //     icon: Icons.account_box,
    //     title: 'profile',
    //   ),
    //   TabItem(
    //     icon: Icons.group,
    //     title: 'groups',
    //   ),
    // ];
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DoctorAuthCubit(getit.get<DoctorRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => DoctorLoginCubit(getit.get<DoctorRepoImpl>()),
        ),
        BlocProvider(
          create: (context) =>
              StudentRegisterCubit(getit.get<DoctorRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => GetMygroupCubit(getit.get<GroupRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => CreateGroupCubit(getit.get<GroupRepoImpl>()),
        ),
        BlocProvider(
          create: (context) =>
              CreatAppointmentCubit(getit.get<AppointmentRepoImpl>()),
        ),
        BlocProvider(
          create: (context) =>
              GetdoctorsCubit(getit.get<AppointmentRepoImpl>()),
        ),
        BlocProvider(
          create: (context) =>
              GetappointmentCubit(getit.get<AppointmentRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => GetfilesCubit(getit.get<FileRepoImpl>()),
        ),
        BlocProvider(
          create: (context) =>
              GetMyAppointmentCubit(getit.get<DoctorRepoImpl1>()),
        ),
        BlocProvider(
          create: (context) => GetProgramCubit(getit.get<DoctorRepoImpl1>()),
        ),
        BlocProvider(
          create: (context) => AddnoteCubit(getit.get<DoctorRepoImpl1>()),
        ),
        BlocProvider(
          create: (context) => GetnotesCubit(getit.get<DoctorRepoImpl1>()),
        ),
        BlocProvider(
          create: (context) =>
              ControlappointmentCubit(getit.get<DoctorRepoImpl1>()),
        ),
        BlocProvider(
          create: (context) =>
              ControlallappointmentCubit(getit.get<DoctorRepoImpl1>()),
        ),
        BlocProvider(
          create: (context) => GetHallsCubit(getit.get<LabRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => GetLabsCubit(getit.get<LabRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => AddComplaintCubit(getit.get<LabRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => GetAvailablePlaceCubit(getit.get<LabRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => AddReserveCubit(getit.get<LabRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => GetReservesCubit(getit.get<LabRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => GetMyfileCubit(getit.get<dfile.FileRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => DeleteFileCubit(getit.get<dfile.FileRepoImpl>()),
        ),
        BlocProvider(
          create: (context) =>
              AddTransactionCubit(getit.get<Transactionrepoimpl>()),
        ),
        BlocProvider(
          create: (context) =>
              GettransactionCubit(getit.get<Transactionrepoimpl>()),
        ),
        BlocProvider(
          create: (context) =>
              EditeTransactionCubit(getit.get<Transactionrepoimpl>()),
        ),
      ],
      child: MaterialApp(
        //  localizationsDelegates: [
        //    GlobalMaterialLocalizations.delegate
        //  ],
        // supportedLocales: <Locale>[
        //   const Locale('en'),
        //   const Locale('zh'),
        //   const Locale('he'),
        //   const Locale('ru'),
        //   const Locale('fr', 'BE'),
        //   const Locale('fr', 'CA'),
        //   const Locale('ja'),
        //   const Locale('de'),
        //   const Locale('hi'),
        //   const Locale('ar'),
        // ],
        // locale:  Locale('ar', null),
        theme: ThemeData(
          scaffoldBackgroundColor: mycolor.Thcolor,
          appBarTheme: const AppBarTheme(
            color: mycolor.Thcolor,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: mycolor.lcolor,
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,

        title: 'Flutter Demo',
        home: Directionality(
          textDirection: ui.TextDirection.rtl,
          child: Scaffold(
            body: LoginPage(),
            // _pages[selectedPage],
            // bottomNavigationBar: BottomBarDefault(
            //   items: items,
            //   backgroundColor: mycolor.mcolor,
            //   color: Colors.white,
            //   colorSelected: mycolor.lcolor,
            //   indexSelected: selectedPage,
            //   paddingVertical: 18,
            //   onTap: (index) => setState(
            //     () {
            //       selectedPage = index;
            //       // switch (index) {
            //       //   case 0:
            //       //     Navigator.of(context).push(
            //       //       MaterialPageRoute(
            //       //         builder: (_) {
            //       //           return StudentAppointment();
            //       //         },
            //       //       ),
            //       //     );
            //       //   case 1:
            //       //     Navigator.of(context).push(
            //       //       MaterialPageRoute(
            //       //         builder: (_) {
            //       //           return Appointments();
            //       //         },
            //       //       ),
            //       //     );
            //       //   case 2:
            //       //     Navigator.of(context).push(
            //       //       MaterialPageRoute(
            //       //         builder: (_) {
            //       //           return ShowLabs();
            //       //         },
            //       //       ),
            //       //     );
            //       // }
            //     },
            //   ),
            // ),
          ),
        ),
      ),
    );
  }
}
