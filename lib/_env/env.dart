class BaseUrl {
  static const String baseUrlApi = "http://54.90.19.107:8000";
  // static const String baseUrlApi = "http://10.0.2.2:8000";
  // static const String baseUrlApi = "http://127.0.0.1:8000";
  static const String baseUrl = baseUrlApi + "/api/v1";

  static const String authPath = '$baseUrl/auth/';
  static const String educationPath = '$baseUrl/education/';
  static const String universityPath = '$baseUrl/university/';
  static const String profilePath = '$baseUrl/profile/';
  static const String postBlog = '$baseUrl/blog/post/';
  static const String postBlogUpdate = '$baseUrl/blog/post/<int:id>';
  static const String postComment = '$baseUrl/blog/post/comment';
  static const String postCommentUpdate = '$baseUrl/blog/post/comment/<int:id>';
  static const String getallnotifications = '$baseUrl/auth/getallnotifications';
  static const String getoffernotifications =
      '$baseUrl/auth/getoffernotifications';

  // Auth APIs
  static const String authIndex = '$baseUrl/auth/';
  static const String register = '$baseUrl/auth/register';
  static const String verifyotp = '$baseUrl/auth/verify-otp/';
  static const String login = '$baseUrl/auth/login';
  static const String home = '$baseUrl/auth/home';
  static const String addQuestion = '$baseUrl/auth/add_question';
  static const String addNotification = '$baseUrl/auth/add_notification';
  static const String univSearch = '$baseUrl/auth/user/univsearch';
  static const String logout = '$baseUrl/auth/logout';
  static const String mood = '$baseUrl/auth/mood';
  static const String userUpdate = '$baseUrl/auth/user/';
  static const String userList = '$baseUrl/auth/user_list';
  static const String sendOtp = '$baseUrl/auth/send-otp';
  static const String tokenObtainPair = '$baseUrl/auth/token';
  static const String tokenRefresh = '$baseUrl/auth/token/refresh';
  static const String changePassword = '$baseUrl/auth/change_password/<int:pk>';
  static const String passwordReset = '$baseUrl/auth/password_reset';

  // Education APIs
  static const String university = '$baseUrl/education/university';
  static const String universityList = '$baseUrl/university/list';
  static const String bookmarkUniversity =
      '$baseUrl/university/bookmarkUniversity';
  static const String course = '$baseUrl/university/courses/';
  static const String universityDetails = '$baseUrl/university/details';
  static const String courseDetails =
      '$baseUrl/university/course/details/<int:id>';
  static const String universityAbout = '$baseUrl/education/university/about/';
  static const String universityFeed = '$baseUrl/education/university/feed/';
  static const String slot = '$baseUrl/education/slot/';
  static const String slotUpdate = '$baseUrl/education/slot/<int:id>';
  static const String mcqInitial = '$baseUrl/education/mcqinitial';
  static const String notification = '$baseUrl/education/notification';
  static const String notificationOffer =
      '$baseUrl/education/notification/offer';
  static const String teachContent = '$baseUrl/education/teachcontent';
  static const String bookmark = '$baseUrl/education/bookmark/';
  static const String bookmarkView = '$baseUrl/education/bookmarkview/';
  static const String galleryView = '$baseUrl/education/galaryview/<int:id>';
  static const String paymentView = '$baseUrl/education/payment/';
  static const String applicationPost = '$baseUrl/education/application/';
  static const String applicationPut =
      '$baseUrl/education/application/<int:id>';

  // applicationsubmit

  static const String applicationView = '$baseUrl/education/applicationview/';
  static const String applicationViewId =
      '$baseUrl/education/applicationview/<int:id>';
  static const String applicationSubmit =
      '$baseUrl/education/applicationsubmit/';
  static const String viewallapplicationsubmit =
      '$baseUrl/education/viewallapplicationsubmit/';

  // University APIs
  static const String universityHome = '$baseUrl/university/home';
  static const String aboutCreate = '$baseUrl/university/about/';
  static const String feedCreate = '$baseUrl/university/feed/';
  static const String galleryCreate = '$baseUrl/university/gallery/';
  static const String coursesCreate = '$baseUrl/university/courses/';
  static const String filtereduniversities =
      '$baseUrl/university/filtereduniversities/';

  // Profile APIs
  static const String profileEducation = '$baseUrl/profile/education/';
  static const String profileEducationHigher =
      '$baseUrl/profile/education/higher/';
  static const String profileEducationSecondary =
      '$baseUrl/profile/education/secondary/';
  static const String profileEducationLower =
      '$baseUrl/profile/education/lower/';
  static const String profileWork = '$baseUrl/profile/work/';
  static const String profileSocial = '$baseUrl/profile/Social/';

  // Gallery APIs
  static const String gallery = '$baseUrl/university';
  static const String universityentrance = gallery + '/universityentrance';
  static const String laboratory = gallery + '/laboratory';
  static const String lecturerooms = gallery + '/lecturerooms';
}
