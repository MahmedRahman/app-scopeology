import 'package:get/get.dart';

import 'package:scopeology/app/modules/Feedback/bindings/feedback_binding.dart';
import 'package:scopeology/app/modules/Feedback/views/feedback_view.dart';
import 'package:scopeology/app/modules/aboutus/bindings/aboutus_binding.dart';
import 'package:scopeology/app/modules/aboutus/views/aboutus_view.dart';
import 'package:scopeology/app/modules/bookmark/bindings/bookmark_binding.dart';
import 'package:scopeology/app/modules/bookmark/views/bookmark_view.dart';
import 'package:scopeology/app/modules/contactus/bindings/contactus_binding.dart';
import 'package:scopeology/app/modules/contactus/views/contactus_view.dart';
import 'package:scopeology/app/modules/create_test/bindings/create_test_binding.dart';
import 'package:scopeology/app/modules/create_test/views/create_test_view.dart';
import 'package:scopeology/app/modules/dashbord/bindings/dashbord_binding.dart';
import 'package:scopeology/app/modules/dashbord/views/dashbord_view.dart';
import 'package:scopeology/app/modules/event_details/bindings/event_details_binding.dart';
import 'package:scopeology/app/modules/event_details/views/event_details_view.dart';
import 'package:scopeology/app/modules/exam/bindings/exam_binding.dart';
import 'package:scopeology/app/modules/exam/views/exam_view.dart';
import 'package:scopeology/app/modules/forgetpassword/bindings/forgetpassword_binding.dart';
import 'package:scopeology/app/modules/forgetpassword/views/forgetpassword_view.dart';
import 'package:scopeology/app/modules/home/bindings/home_binding.dart';
import 'package:scopeology/app/modules/home/views/home_view.dart';
import 'package:scopeology/app/modules/introduction/bindings/introduction_binding.dart';
import 'package:scopeology/app/modules/introduction/views/introduction_view.dart';
import 'package:scopeology/app/modules/layout/bindings/layout_binding.dart';
import 'package:scopeology/app/modules/layout/views/layout_view.dart';
import 'package:scopeology/app/modules/medical_calendar/bindings/medical_calendar_binding.dart';
import 'package:scopeology/app/modules/medical_calendar/views/medical_calendar_view.dart';
import 'package:scopeology/app/modules/my_conferences/bindings/my_conferences_binding.dart';
import 'package:scopeology/app/modules/my_conferences/views/my_conferences_view.dart';
import 'package:scopeology/app/modules/newpassword/bindings/newpassword_binding.dart';
import 'package:scopeology/app/modules/newpassword/views/newpassword_view.dart';
import 'package:scopeology/app/modules/notifaction/bindings/notifaction_binding.dart';
import 'package:scopeology/app/modules/notifaction/views/notifaction_view.dart';
import 'package:scopeology/app/modules/previous_test/bindings/previous_test_binding.dart';
import 'package:scopeology/app/modules/previous_test/views/previous_test_view.dart';
import 'package:scopeology/app/modules/profile/bindings/profile_binding.dart';
import 'package:scopeology/app/modules/profile/views/profile_view.dart';
import 'package:scopeology/app/modules/resetpassword/bindings/resetpassword_binding.dart';
import 'package:scopeology/app/modules/resetpassword/views/resetpassword_view.dart';
import 'package:scopeology/app/modules/signin/bindings/signin_binding.dart';
import 'package:scopeology/app/modules/signin/views/signin_view.dart';
import 'package:scopeology/app/modules/signup/bindings/signup_binding.dart';
import 'package:scopeology/app/modules/signup/views/signup_view.dart';
import 'package:scopeology/app/modules/splash/bindings/splash_binding.dart';
import 'package:scopeology/app/modules/splash/views/splash_view.dart';
import 'package:scopeology/app/modules/subscriptionPay/bindings/subscription_pay_binding.dart';
import 'package:scopeology/app/modules/subscriptionPay/views/subscription_pay_view.dart';
import 'package:scopeology/app/modules/subscriptionPlan/bindings/subscription_plan_binding.dart';
import 'package:scopeology/app/modules/subscriptionPlan/views/subscription_plan_view.dart';
import 'package:scopeology/app/modules/ticket_details/bindings/ticket_details_binding.dart';
import 'package:scopeology/app/modules/ticket_details/views/ticket_details_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.INTRODUCTION,
      page: () => IntroductionView(),
      binding: IntroductionBinding(),
    ),
    GetPage(
      name: _Paths.SIGNIN,
      page: () => SigninView(),
      binding: SigninBinding(),
    ),
    GetPage(
      name: _Paths.FORGETPASSWORD,
      page: () => ForgetpasswordView(),
      binding: ForgetpasswordBinding(),
    ),
    GetPage(
      name: _Paths.RESETPASSWORD,
      page: () => ResetpasswordView(),
      binding: ResetpasswordBinding(),
    ),
    GetPage(
      name: _Paths.NEWPASSWORD,
      page: () => NewpasswordView(),
      binding: NewpasswordBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.DASHBORD,
      page: () => DashbordView(),
      binding: DashbordBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFACTION,
      page: () => NotifactionView(),
      binding: NotifactionBinding(),
    ),
    GetPage(
      name: _Paths.LAYOUT,
      page: () => LayoutView(),
      binding: LayoutBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_TEST,
      page: () => CreateTestView(),
      binding: CreateTestBinding(),
    ),
    GetPage(
      name: _Paths.PREVIOUS_TEST,
      page: () => PreviousTestView(),
      binding: PreviousTestBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.SUBSCRIPTION_PLAN,
      page: () => SubscriptionPlanView(),
      binding: SubscriptionPlanBinding(),
    ),
    GetPage(
      name: _Paths.FEEDBACK,
      page: () => FeedbackView(),
      binding: FeedbackBinding(),
    ),
    GetPage(
      name: _Paths.CONTACTUS,
      page: () => ContactusView(),
      binding: ContactusBinding(),
    ),
    GetPage(
      name: _Paths.ABOUTUS,
      page: () => AboutusView(),
      binding: AboutusBinding(),
    ),
    GetPage(
      name: _Paths.SUBSCRIPTION_PAY,
      page: () => SubscriptionPayView(),
      binding: SubscriptionPayBinding(),
    ),
    GetPage(
      name: _Paths.BOOKMARK,
      page: () => BookmarkView(),
      binding: BookmarkBinding(),
    ),
    GetPage(
      name: _Paths.EXAM,
      page: () => ExamView(''),
      binding: ExamBinding(),
    ),
    GetPage(
      name: _Paths.MEDICAL_CALENDAR,
      page: () => MedicalCalendarView(),
      binding: MedicalCalendarBinding(),
    ),
    GetPage(
      name: _Paths.MY_CONFERENCES,
      page: () => MyConferencesView(),
      binding: MyConferencesBinding(),
    ),
    GetPage(
      name: _Paths.EVENT_DETAILS,
      page: () => EventDetailsView(),
      binding: EventDetailsBinding(),
    ),
    GetPage(
      name: _Paths.TICKET_DETAILS,
      page: () => TicketDetailsView(),
      binding: TicketDetailsBinding(),
    ),
  ];
}
