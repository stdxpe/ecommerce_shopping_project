part of 'utilities_library_imports.dart';

abstract class AppStrings {
  /// [APP WIDE GLOBAL VARIABLE]
  /// ALL STATIC STRINGS - EN

  static const String appTitle = 'fshx.';
  static const String appBarTitle = 'fshx.';
  static const String appSubtitle = 'Best Fashion Shopping App';

  static const String signUp = 'Sign Up';
  static const String signIn = 'Sign In';
  static const String logIn = 'Log In';
  static const String signUpWithEmail = 'Sign Up with Email';
  static const String continueWithGoogle = 'Continue with Google';
  static const String alreadyHaveAnAccount = 'Already have an account?   ';
  static const String dontHaveAnAccount = 'Don\'t have an account?   ';
  static const String continueButton = 'Continue';

  static const String collectionTitleRightButton = 'See all';
  static const String itemsFound = ' items found';
  static const String itemFound = ' item found';

  static const String cardNewTag = 'NEW';
  static const String cardOnSaleTag = 'ON SALE';

  static const String globalStateErrorMessage = 'Error. Please try again later';

  /// ONBOARDING SCREEN
  static const String onboardingScreenTitle = 'Swipe to browse';
  static const String onboardingScreenSubtitle =
      'Discover products easily by swiping from\none category to another';
  static const String onboardingScreenButton = 'Start Shopping';

  /// SIGN IN SCREEN
  static const String signInScreenTitle = 'Log into\nyour account';
  static const String signInScreenTextFieldEmail = 'Email';
  static const String signInScreenTextFieldPassword = 'Password';
  static const String signInScreenCheckboxRememberMe = 'Remember Me';

  /// SIGN UP SCREEN
  static const String signUpScreenTitle = 'Create\nyour account';
  static const String signUpScreenTextFieldEmail = 'Email';
  static const String signUpScreenTextFieldPassword = 'Password';
  static const String signUpScreenTextFieldConfirmPassword = 'Confirm Password';
  static const String signUpScreenCheckboxPolicy =
      'By signing up, you agree to the terms of service\nand our privacy policy';

  /// FORGOT PASSWORD SCREEN
  static const String forgotPasswordScreenTitle = 'Forgot Password?';
  static const String forgotPasswordScreenSubtitle =
      'If you need help resetting your password,\nwe can help by sending you a link to reset it.';
  static const String forgotPasswordScreenButton = 'Send';
  static const String forgotPasswordScreenTextField = 'Phone';

  /// VERIFICATION SCREEN
  static const String verificationScreenTitle =
      'Enter the Code\nto Verify Your Phone';
  static const String verificationScreenSubtitle =

      ///TODO: Number gotta be dynamic.
      'We have sent you an SMS with a code \nto the number +123 456 789';
  static const String verificationScreenButton = 'Send a new code';

  /// HOME SCREEN
  static const String dealsOfTheWeek = 'Deals of the Week';
  static const String dialogPopupNewDealsButtonText = 'Check Out';
  static const String dialogPopupNewDealsTitle = 'Winter\nCollection';
  static const String dialogPopupNewDealsSubtitle = '20% Off Selected Brands';

  /// WISHLIST SCREEN
  static const String wishlistScreenTitle = 'Wishlist';

  /// SHOPPING CART SCREEN
  static const String shoppingCartScreenTitle = 'Shopping Cart';
  static const String shoppingCartScreenButton = 'Continue to Payment';
  static const String totalAmount = 'Total Amount';

  /// PROFILE SCREEN
  static const String profileScreenButtonSaveProfile = 'Save Profile';
  static const String profileScreenButtonDelete = 'Delete';

  static const String profileEditScreenTextfieldName = 'Name';
  static const String profileEditScreenTextfieldEmail = 'Email';
  static const String profileEditScreenTextfieldPhone = 'Phone Number';
  static const String profileEditScreenTextfieldBirthday = 'Birthday';

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
  static const String addressesScreenSectionEditButton = 'Edit';
  static const String addressesScreenSaveButton = 'Save';
  static const String addressesScreenDeleteButton = 'Delete';
  static const String addressesScreenEmptyMessage =
      'You haven\t added any addresses yet';
  static const String addressesAddressTextfieldText = 'Address';
  static const String addressesCityTextfieldText = 'City';
  static const String addressesZipCodeTextfieldText = 'Zip Code';
  static const String addressesCountyTextfieldText = 'Country';
  static const String addressesAddressTextfieldHintText = 'Detailed Address';
  static const String addressesCityTextfieldHintText = 'City or Town';
  static const String addressesZipCodeTextfieldHintText = 'Zip Code';
  static const String addressesCountyTextfieldHintText = 'Country';

  static const String creditCardsScreenTitle = 'Credit Cards';
  static const String creditCardsScreenSectionEditButton = 'Edit';
  static const String creditCardsScreenSectionSaveButton = 'Save';
  static const String creditCardsScreenSectionDeleteButton = 'Delete';

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
  static const String detailsScreenButtonAddToShoppingCart =
      'Add to Shopping Cart';
  static const String productDetailsScreenDialogPopupAddedToWishlistMessage =
      'You\'ve added\nthis item to wishlist';
  static const String
      productDetailsScreenDialogPopupAddedToShoppingCartMessage =
      'Success! You\'ve added\nthis item to your cart.';
  static const String productDetailsScreenPopupButtonGoToShoppingCart =
      'Go to Shopping Cart';
  static const String productDetailsScreenPopupButtonContinueShopping =
      'Continue Shopping';

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
  static const double filtersScreenMinPrice = 150;
  static const double filtersScreenMaxPrice = 750;
  static const String filtersScreenPriceRange = 'Price Range';
  static const String filtersScreenSize = 'Size';
  static const String filtersScreenColor = 'Color';
  static const String filtersScreenCollections = 'Collections';
  static const String filtersScreenBrands = 'Brands';
  static const String filtersScreenRating = 'Rating';
  static const String filtersScreenSortBy = 'Sort By';

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
      'Thank you for purchasing. Your order\nwill be shipped in 2-4 working days.';
  static const String paymentScreenTitleFailedResultMessage = 'Failed!';
  static const String paymentScreenSubtitleFailedResultMessage =
      'An error occured during the process. Please try again.';

  static const String paymentScreenShippingSheetButton = 'Continue';
  static const String paymentScreenPaymentSheetButton = 'Continue';
  static const String paymentScreenSummarySheetButton = 'Pay ';
  static const String paymentScreenResultSheetButton = 'Continue';

  static const String paymentScreenSummarySheetSectionButtonChange = 'Change';
  static const String paymentScreenSummarySheetSectionAddress =
      'Shipping Address';
  static const String paymentScreenSummarySheetSectionPayment = 'Payment';

  static const String paymentScreenResultMessageButton = 'Continue';

  static const String paymentScreenShippingTextField1 = 'Full Name';
  static const String paymentScreenShippingTextField2 = 'Address';
  static const String paymentScreenShippingTextField3 = 'City';
  static const String paymentScreenShippingTextField4 = 'Zip Code';
  static const String paymentScreenShippingTextField5 = 'Country';
  static const String paymentScreenShippingCheckBox = 'Save this address';

  static const String paymentScreenCreditCardTextField1 = 'Card Holder';
  static const String paymentScreenCreditCardTextField2 = 'Card Number';
  static const String paymentScreenCreditCardTextField3 = 'Exp.Date';
  static const String paymentScreenCreditCardTextField4 = 'CVV';
  static const String paymentScreenCreditCardCheckBox = 'Save this credit card';

  /// Bottom Navigation Bar Related
  static const String bottomNavBarHome = 'Home';
  static const String bottomNavBarDiscover = 'Discover';
  static const String bottomNavBarCart = 'Cart';
  static const String bottomNavBarWishlist = 'Wishlist';
  static const String bottomNavBarProfile = 'Profile';
}
