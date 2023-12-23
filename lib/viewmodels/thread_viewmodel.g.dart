// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thread_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$threadViewModelHash() => r'b5311a0f449e2a86043b39827a953fe431834665';

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
    extends BuildlessAutoDisposeNotifier<ThreadState> {
  late final ({DatabaseManager databaseManager, int id}) databaseProps;
  late final TextEditingController spoolTextEditingController;
  late final TextEditingController subjectTextEditingController;

  ThreadState build({
    required ({DatabaseManager databaseManager, int id}) databaseProps,
    required TextEditingController spoolTextEditingController,
    required TextEditingController subjectTextEditingController,
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
class ThreadViewModelFamily extends Family<ThreadState> {
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
    required TextEditingController subjectTextEditingController,
  }) {
    return ThreadViewModelProvider(
      databaseProps: databaseProps,
      spoolTextEditingController: spoolTextEditingController,
      subjectTextEditingController: subjectTextEditingController,
    );
  }

  @override
  ThreadViewModelProvider getProviderOverride(
    covariant ThreadViewModelProvider provider,
  ) {
    return call(
      databaseProps: provider.databaseProps,
      spoolTextEditingController: provider.spoolTextEditingController,
      subjectTextEditingController: provider.subjectTextEditingController,
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
    extends AutoDisposeNotifierProviderImpl<ThreadViewModel, ThreadState> {
  /// ViewModel for a Thread.
  ///
  /// Used by [ThreadView].
  ///
  /// Copied from [ThreadViewModel].
  ThreadViewModelProvider({
    required ({DatabaseManager databaseManager, int id}) databaseProps,
    required TextEditingController spoolTextEditingController,
    required TextEditingController subjectTextEditingController,
  }) : this._internal(
          () => ThreadViewModel()
            ..databaseProps = databaseProps
            ..spoolTextEditingController = spoolTextEditingController
            ..subjectTextEditingController = subjectTextEditingController,
          from: threadViewModelProvider,
          name: r'threadViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$threadViewModelHash,
          dependencies: ThreadViewModelFamily._dependencies,
          allTransitiveDependencies:
              ThreadViewModelFamily._allTransitiveDependencies,
          databaseProps: databaseProps,
          spoolTextEditingController: spoolTextEditingController,
          subjectTextEditingController: subjectTextEditingController,
        );

  ThreadViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.databaseProps,
    required this.spoolTextEditingController,
    required this.subjectTextEditingController,
  }) : super.internal();

  final ({DatabaseManager databaseManager, int id}) databaseProps;
  final TextEditingController spoolTextEditingController;
  final TextEditingController subjectTextEditingController;

  @override
  ThreadState runNotifierBuild(
    covariant ThreadViewModel notifier,
  ) {
    return notifier.build(
      databaseProps: databaseProps,
      spoolTextEditingController: spoolTextEditingController,
      subjectTextEditingController: subjectTextEditingController,
    );
  }

  @override
  Override overrideWith(ThreadViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: ThreadViewModelProvider._internal(
        () => create()
          ..databaseProps = databaseProps
          ..spoolTextEditingController = spoolTextEditingController
          ..subjectTextEditingController = subjectTextEditingController,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        databaseProps: databaseProps,
        spoolTextEditingController: spoolTextEditingController,
        subjectTextEditingController: subjectTextEditingController,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<ThreadViewModel, ThreadState>
      createElement() {
    return _ThreadViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ThreadViewModelProvider &&
        other.databaseProps == databaseProps &&
        other.spoolTextEditingController == spoolTextEditingController &&
        other.subjectTextEditingController == subjectTextEditingController;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, databaseProps.hashCode);
    hash = _SystemHash.combine(hash, spoolTextEditingController.hashCode);
    hash = _SystemHash.combine(hash, subjectTextEditingController.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ThreadViewModelRef on AutoDisposeNotifierProviderRef<ThreadState> {
  /// The parameter `databaseProps` of this provider.
  ({DatabaseManager databaseManager, int id}) get databaseProps;

  /// The parameter `spoolTextEditingController` of this provider.
  TextEditingController get spoolTextEditingController;

  /// The parameter `subjectTextEditingController` of this provider.
  TextEditingController get subjectTextEditingController;
}

class _ThreadViewModelProviderElement
    extends AutoDisposeNotifierProviderElement<ThreadViewModel, ThreadState>
    with ThreadViewModelRef {
  _ThreadViewModelProviderElement(super.provider);

  @override
  ({DatabaseManager databaseManager, int id}) get databaseProps =>
      (origin as ThreadViewModelProvider).databaseProps;
  @override
  TextEditingController get spoolTextEditingController =>
      (origin as ThreadViewModelProvider).spoolTextEditingController;
  @override
  TextEditingController get subjectTextEditingController =>
      (origin as ThreadViewModelProvider).subjectTextEditingController;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
