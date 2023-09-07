// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thread_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$threadViewModelHash() => r'395f1ba37075093985692dad2e51c12f6e8f90d3';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$ThreadViewModel
    extends BuildlessAutoDisposeNotifier<ThreadCollection> {
  late final ({DatabaseManager databaseManager, int id}) databaseProps;
  late final TextEditingController spoolTextEditingController;

  ThreadCollection build({
    required ({DatabaseManager databaseManager, int id}) databaseProps,
    required TextEditingController spoolTextEditingController,
  });
}

/// ViewModel for a Thread.
///
/// Used by [ThreadView].
///
/// Copied from [ThreadViewModel].
@ProviderFor(ThreadViewModel)
const threadViewModelProvider = ThreadViewModelFamily();

/// ViewModel for a Thread.
///
/// Used by [ThreadView].
///
/// Copied from [ThreadViewModel].
class ThreadViewModelFamily extends Family<ThreadCollection> {
  /// ViewModel for a Thread.
  ///
  /// Used by [ThreadView].
  ///
  /// Copied from [ThreadViewModel].
  const ThreadViewModelFamily();

  /// ViewModel for a Thread.
  ///
  /// Used by [ThreadView].
  ///
  /// Copied from [ThreadViewModel].
  ThreadViewModelProvider call({
    required ({DatabaseManager databaseManager, int id}) databaseProps,
    required TextEditingController spoolTextEditingController,
  }) {
    return ThreadViewModelProvider(
      databaseProps: databaseProps,
      spoolTextEditingController: spoolTextEditingController,
    );
  }

  @override
  ThreadViewModelProvider getProviderOverride(
    covariant ThreadViewModelProvider provider,
  ) {
    return call(
      databaseProps: provider.databaseProps,
      spoolTextEditingController: provider.spoolTextEditingController,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'threadViewModelProvider';
}

/// ViewModel for a Thread.
///
/// Used by [ThreadView].
///
/// Copied from [ThreadViewModel].
class ThreadViewModelProvider
    extends AutoDisposeNotifierProviderImpl<ThreadViewModel, ThreadCollection> {
  /// ViewModel for a Thread.
  ///
  /// Used by [ThreadView].
  ///
  /// Copied from [ThreadViewModel].
  ThreadViewModelProvider({
    required this.databaseProps,
    required this.spoolTextEditingController,
  }) : super.internal(
          () => ThreadViewModel()
            ..databaseProps = databaseProps
            ..spoolTextEditingController = spoolTextEditingController,
          from: threadViewModelProvider,
          name: r'threadViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$threadViewModelHash,
          dependencies: ThreadViewModelFamily._dependencies,
          allTransitiveDependencies:
              ThreadViewModelFamily._allTransitiveDependencies,
        );

  final ({DatabaseManager databaseManager, int id}) databaseProps;
  final TextEditingController spoolTextEditingController;

  @override
  bool operator ==(Object other) {
    return other is ThreadViewModelProvider &&
        other.databaseProps == databaseProps &&
        other.spoolTextEditingController == spoolTextEditingController;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, databaseProps.hashCode);
    hash = _SystemHash.combine(hash, spoolTextEditingController.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  ThreadCollection runNotifierBuild(
    covariant ThreadViewModel notifier,
  ) {
    return notifier.build(
      databaseProps: databaseProps,
      spoolTextEditingController: spoolTextEditingController,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
