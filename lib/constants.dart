// API service
///

//const String myToken = '';
const String baseURL = 'api.github.com';
const String pathURL = 'search/repositories';
const int searchResultsOutput = 15;
const Map<String, String> headers = {
  'Accept': 'application/vnd.github+json',
  'Authorization': 'Bearer ',
};

// TEXTS

/// LoadingScreen
const String loadingText = 'Search App';

/// SearchScreen
const String navigationBarSearchScreen = 'Github repos list';
const String searchHistory = 'Search History';
const String emptyHistory =
    'You have empty history. \nClick on search to start journey!';
const String emptySearchResultHeader = 'What we found';
const String emptySearchResultBody =
    'Nothing was found for your search. \nPlease check the spelling';
const String searchResultHeader = 'What we have found';
const String hintText = 'Search';

///FavoriteScreen

const String navigationBarFavoriteScreen = 'Favorite repos list';
const String favoriteScreenEmptyBody =
    'You have no favorites. \nClick on star while searching to add first favorite';
