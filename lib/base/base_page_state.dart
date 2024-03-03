part of 'base.dart';

abstract class BasePageState<T extends StatefulWidget, B extends BaseBloc,
        A extends BaseAppBloc> extends _BasePageStateDelegate<T, B, A>
    with LogMixin {}

abstract class _BasePageStateDelegate<
    T extends StatefulWidget,
    B extends BaseBloc,
    A extends BaseAppBloc> extends State<T> implements ExceptionListener {
  late final BaseNavigator navigator = GetIt.instance.get<BaseNavigator>();
  late final BaseAppBloc appBloc = GetIt.instance.get<A>();

  late final BaseExceptionMapper exceptionMapper =
      GetIt.instance.get<BaseExceptionMapper>();
  late final BaseExceptionHandler exceptionHandler =
      GetIt.instance.get<BaseExceptionHandler>()
        ..initialize(
          navigator: navigator,
          listener: this,
        );

  late final DisposeBag disposeBag = DisposeBag();
  late final BaseClearUserDataUseCase _clearUserDataUseCase =
      GetIt.instance.get<BaseClearUserDataUseCase>();
  late final CommonBloc commonBloc = CommonBloc(_clearUserDataUseCase)
    ..navigator = navigator
    ..appBloc = appBloc
    ..disposeBag = disposeBag
    ..exceptionHandler = exceptionHandler
    ..exceptionMapper = exceptionMapper;

  late final B bloc = GetIt.instance.get<B>()
    ..navigator = navigator
    ..appBloc = appBloc
    ..commonBloc = commonBloc
    ..disposeBag = disposeBag
    ..exceptionHandler = exceptionHandler
    ..exceptionMapper = exceptionMapper;

  bool get isAppWidget => false;

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => navigator,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => bloc),
          BlocProvider(create: (_) => commonBloc),
        ],
        child: BlocListener<CommonBloc, CommonState>(
          listenWhen: (previous, current) =>
              previous.exceptionWrapper != current.exceptionWrapper &&
              current.exceptionWrapper != null,
          listener: (context, state) {
            handleException(state.exceptionWrapper!);
          },
          child: isAppWidget
              ? buildPage(context)
              : Stack(
                  children: [
                    buildPage(context),
                    BlocBuilder<CommonBloc, CommonState>(
                      buildWhen: (previous, current) =>
                          previous.isLoading != current.isLoading,
                      builder: (context, state) => Visibility(
                        visible: state.isLoading,
                        child: buildPageLoading(),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Widget buildPageListeners({required Widget child}) => child;

  Widget buildPageLoading() => const Center(
        child: CircularProgressIndicator(),
      );

  Widget buildPage(BuildContext context);

  @override
  void dispose() {
    super.dispose();
    disposeBag.dispose();
  }

  void handleException(ExceptionWrapper exceptionWrapper) {
    exceptionHandler
        .handleException(
      exceptionWrapper,
      handleExceptionMessage(exceptionWrapper.appException),
    )
        .then((value) {
      exceptionWrapper.exceptionCompleter?.complete();
    });
  }

  String handleExceptionMessage(BaseException appException) {
    return exceptionMapper.map(appException);
  }

  @override
  void onRefreshTokenFailed() {
    commonBloc.add(ForceLogoutButtonPressed());
  }
}
