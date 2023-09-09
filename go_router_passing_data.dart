return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      routerConfig: GoRouter(
        routes: [
          GoRoute(
            path: '/',
            pageBuilder: (context, state) => MaterialPage(
              child: SwipableView(title: 'Flutter'),
            ),
            routes: [
              GoRoute(
                path: 'detailPage',
                pageBuilder: (context, state) {
                  final selectedArray = state.extra! as List<Location>;
                  return MaterialPage(
                    child: DetailsView(
                      selectedArray: selectedArray,
                    ),
                  );
                },
              ),
              GoRoute(
                path: 'detailCardPage',
                pageBuilder: (context, state) {
                  final selectedElement = state.extra! as Location;
                  return MaterialPage(
                    child: CardDetails(
                      selectedLocation: selectedElement,
                    ),
                  );
                },
              )
            ],
          ),
        ],
      ),
      // home: const MyHomePage(title: 'Honeymoon Flutter'),
    );
