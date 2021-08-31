abstract class NewsState {}

class NewInitialState extends NewsState {}

class NewBottomNavState extends NewsState {}

class GetLoadingBusinessData extends NewsState {}

class GetSuccessBusinessData extends NewsState {}

class GetErrorBusinessData extends NewsState {
  final String error;

  GetErrorBusinessData(this.error);
}

class GetLoadingSportsData extends NewsState {}

class GetSuccessSportsData extends NewsState {}

class GetErrorSportsData extends NewsState {
  final String error;

  GetErrorSportsData(this.error);}

class GetLoadingScienceData extends NewsState {}

class GetSuccessScienceData extends NewsState {}

class GetErrorScienceData extends NewsState {
  final String error;

  GetErrorScienceData(this.error);}

class GetLoadingSearchData extends NewsState {}

class GetSuccessSearchData extends NewsState {}

class GetErrorSearchData extends NewsState {
  final String error;

  GetErrorSearchData(this.error);}




