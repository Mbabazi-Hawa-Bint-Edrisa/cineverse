import 'package:get/get.dart';
import 'package:group_five/app/routes/app_pages.dart';


class GetStartedController extends GetxController {
  // Page controller to manage the onboarding screens
  var currentPage = 0.obs;

  // List of onboarding screen data (title, description, image URL)
  final List<Map<String, String>> onboardingData = [
    {
      'title': 'Welcome to Movie App',
      'description': 'Discover and watch your favorite movies.',
      'image': 'https://images.unsplash.com/photo-1485846234645-a62644f84728?ixlib=rb-4.0.3&auto=format&fit=crop&w=1350&q=80',
    },
    {
      'title': 'Explore New Releases',
      'description': 'Stay updated with the latest movies.',
      'image': 'https://images.unsplash.com/photo-1598899134739-5f912e48b2a2?ixlib=rb-4.0.3&auto=format&fit=crop&w=1350&q=80',
    },
    {
      'title': 'Create Your List',
      'description': 'Add movies to your watchlist.',
      'image': 'https://images.unsplash.com/photo-1616530940355-351fabd46501?ixlib=rb-4.0.3&auto=format&fit=crop&w=1350&q=80',
    },
  ];

  // Update the current page index
  void onPageChanged(int index) {
    currentPage.value = index;
  }

  // Navigate to the next page or to the register screen
  void nextPage() {
    if (currentPage.value < onboardingData.length - 1) {
      currentPage.value++;
    } else {
      Get.offNamed(Routes.register);
    }
  }

  // Skip onboarding and go directly to register
  void skipOnboarding() {
    Get.offNamed(Routes.register);
  }
}