part of 'utilities_library_imports.dart';

abstract class AppStrings {
  /// [APP WIDE GLOBAL VARIABLE]
  /// ALL STATIC STRINGS - EN

  static const String appTitle = 'FSHX';
  static const String appBarTitle = 'FSHX';
  static const String appSubtitle = 'Best Fashion Shopping App';

  static const String signUp = 'Sign Up';
  static const String signIn = 'Sign In';
  static const String signUpWithEmail = 'Sign Up with Email';
  static const String continueWithGoogle = 'Continue with Google';
  static const String alreadyHaveAnAccount = 'Already have an account?  ';
  static const String dontHaveAnAccount = 'Don\'t have an account?  ';
  static const String continueButton = 'Continue';

  static const String collectionTitleRightButton = 'See all';
  static const String itemsFound = ' items found';

  /// ONBOARDING SCREEN
  static const String onboardingScreenTitle = 'Swipe to browse';
  static const String onboardingScreenSubtitle =
      'Discover products easily by swiping from\none category to another';
  static const String onboardingScreenButton = 'Start Shopping';

  /// SIGN IN SCREEN
  static const String signInScreenTitle = 'Log into\nyour account';
  static const String signInScreenTextFieldEmail = 'Email';
  static const String signInScreenTextFieldPassword = 'Password';
  static const String signInScreenTextFieldRememberMe = 'Remember Me';

  /// SIGN UP SCREEN
  static const String signUpScreenTitle = 'Create\nyour account';
  static const String signUpScreenTextFieldEmail = 'Email';
  static const String signUpScreenTextFieldPassword = 'Password';
  static const String signUpScreenTextFieldConfirmPassword = 'Confirm Password';

  /// FORGOT PASSWORD SCREEN
  static const String forgotPasswordScreenTitle = 'Forgot Password?';
  static const String forgotPasswordScreenSubTitle =
      'If you need help resetting your password,\nwe can help by sending you a link to reset it.';
  static const String forgotPasswordScreenButton = 'Send';

  /// VERIFICATION SCREEN
  static const String verificationScreenTitle =
      'Enter the Code\nto Verify Your Phone';
  static const String verificationScreenSubtitle =
      'We have sent you an SMS with a code \nto the number +123 456 789';
  static const String verificationScreenButton = 'Send a new code';

  /// HOME SCREEN
  static const String dealsOfTheWeek = 'Deals of the Week';

  /// WISHLIST SCREEN
  static const String wishlistScreenTitle = 'Wishlist';

  /// SHOPPING CART SCREEN
  static const String shoppingCartScreenTitle = 'Shopping Cart';
  static const String shoppingCartScreenButton = 'Continue';
  static const String totalAmount = 'Total Amount';

  /// PROFILE SCREEN
  static const String profileScreenButtonSaveProfile = 'Save Profile';
  static const String profileScreenButtonDelete = 'Delete';

  static const String profileEditNameTextfieldText = 'Name';
  static const String profileEditEmailTextfieldText = 'Email';
  static const String profileEditPhoneTextfieldText = 'Phone Number';
  static const String profileEditBirthdayTextfieldText = 'Birthday';
  static const String profileEditNameTextfieldHintText = 'JANE DOE';
  static const String profileEditEmailTextfieldHintText = 'janedoe@email.com';
  static const String profileEditPhoneTextfieldHintText = '5558884422';
  static const String profileEditBirthdayTextfieldHintText = '19/05/1998';

  static const String profileScreenButtonsListItemOrders = 'Orders';
  static const String profileScreenButtonsListItemAddresses =
      'Shipping Addresses';
  static const String profileScreenButtonsListItemCreditCards = 'Credit Cards';
  static const String profileScreenButtonsListItemDarkMode = 'Dark Mode';
  static const String profileScreenButtonsListItemNotifications =
      'Notifications';
  static const String profileScreenButtonsListItemChangePassword =
      'ChangePassword';
  static const String profileScreenButtonsListItemAboutUs = 'About Us';
  static const String profileScreenButtonsListItemSignOut = 'Sign Out';

  static const String ordersScreenTitle = 'Orders';
  static const String aordersScreenEmptyMessage =
      'You haven\t added any orders yet';

  static const String trackingOrderScreenTitle = 'Tracking Order';
  static const String trackingOrderScreenStepReceived = 'Received';
  static const String trackingOrderScreenStepPrepared = 'Prepared';
  static const String trackingOrderScreenStepOnTheWay = 'On the Way';
  static const String trackingOrderScreenStepDelivered = 'Delivered';

  static const String addressesScreenTitle = 'Addresses';
  static const String addressesScreenEmptyMessage =
      'You haven\t added any addresses yet';
  static const String addressesScreenButton = 'Save Address';
  static const String addressesAddressTextfieldText = 'Address';
  static const String addressesCityTextfieldText = 'City';
  static const String addressesZipCodeTextfieldText = 'Zip Code';
  static const String addressesCountyTextfieldText = 'Country';
  static const String addressesAddressTextfieldHintText = 'Detailed Address';
  static const String addressesCityTextfieldHintText = 'City or Town';
  static const String addressesZipCodeTextfieldHintText = 'Zip Code';
  static const String addressesCountyTextfieldHintText = 'Country';

  static const String creditCardsScreenTitle = 'Credit Cards';
  static const String creditCardScreenEmptyMessage =
      'You haven\t added any credit card yet';
  static const String creditCardsScreenButton = 'Save Credit Card';
  static const String creditCardsCardHolderTextfieldText = 'Card Holder';
  static const String creditCardsCardNumberTextfieldText = 'Card Number';
  static const String creditCardsExpDateTextfieldText = 'Exp.Date';
  static const String creditCardsCvvTextfieldText = 'CVV';
  static const String creditCardsCardHolderTextfieldHintText = 'JANE DOE';
  static const String creditCardsCardNumberTextfieldHintText =
      '1234567891234567';
  static const String creditCardsExpDateTextfieldHintText = '0123';
  static const String creditCardsCvvTextfieldHintText = '123';

  /// DETAILS SCREEN
  static const String productDetailsScreenReviews = ' Reviews';
  static const String productDetailsScreenMessageProductAddedToWishlistMessage =
      'Go to Shopping Cart';
  static const String productDetailsScreenPopupButtonGoToShoppingCart =
      'You\'ve added\nthis item to wishlist';
  static const String productDetailsScreenPopupButtonContinueShopping =
      'Continue Shopping';
  static const String productDetailsScreenProductAddedToShoppingCartMessage =
      'Success! You\'ve added\nthis item to your cart.';

  /// REVIEWS SCREEN
  static const String reviewsScreenButtonAddToShoppingCart =
      'Add to Shopping Cart';

  /// DISCOVER SCREEN
  static const String discoverScreenTitle = 'Discover';

  /// SEARCH SCREEN
  static const String searchScreenTitle = 'Search';
  static const String searchScreenSearchBoxTextfieldHintText = 'Search';
  static const String searchScreenInitialText = 'Please search for a product';

  /// FILTERS SCREEN
  static const String filtersScreenTitle = 'Filters';
  static const String filtersScreenButtonClear = 'Clear';
  static const String filtersScreenButtonApply = 'Apply';
  static const String filtersScreenPriceRange = 'Price Range';
  static const double filtersScreenMinPrice = 50;
  static const double filtersScreenMaxPrice = 200;
  static const String filtersScreenSize = 'Size';
  static const String filtersScreenCollections = 'Collections';
  static const String filtersScreenRating = 'Rating';
  static const String filtersScreenSortBy = 'Sort by';

  /// PAYMENT SCREEN
  static const String paymentStep = 'Step ';
  static const String paymentScreenTitleShipping = 'Shipping';
  static const String paymentScreenTitlePayment = 'Payment';
  static const String paymentScreenTitleSummary = 'Summary';
  static const String paymentScreenTitleResult = 'Result';
  static const String paymentScreenTitleWaitingResultMessage = 'Waiting...';
  static const String paymentScreenSubtitleWaitingResultMessage =
      'Please wait for the result.';
  static const String paymentScreenTitleSuccessResultMessage = 'Success!';
  static const String paymentScreenSubtitleSuccessResultMessage =
      'Thank you for purchasing. Your order will be shipped in 2-4 working days.';
  static const String paymentScreenTitleFailedResultMessage = 'Failed!';
  static const String paymentScreenSubtitleFailedResultMessage =
      'An error occured during the process. Please try again.';
  static const String paymentScreenResultMessageButton = 'Continue';

  static const String paymentScreenButtonContinue = 'Continue';
  static const String paymentScreenButtonBack = 'Back';
  static const String paymentScreenButtonPay = 'Pay ';
  static const String paymentScreenButtonContinueShopping = 'Continue Shopping';

  static const String paymentScreenAddressSwitchText = 'Save this address';
  static const String paymentScreenCreditCardSwitchText =
      'Save this credit card';
}
