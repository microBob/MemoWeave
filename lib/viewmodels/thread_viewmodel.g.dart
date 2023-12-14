// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thread_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$threadViewModelHash() => r'242fb7964e1738954b46b04ec5222a6cdbac0dfd';

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
    required ({DatabaseManager databaseManager, int id}) databaseProps,
    required TextEditingController spoolTextEditingController,
  }) : this._internal(
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
          databaseProps: databaseProps,
          spoolTextEditingController: spoolTextEditingController,
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
  }) : super.internal();

  final ({DatabaseManager databaseManager, int id}) databaseProps;
  final TextEditingController spoolTextEditingController;

  @override
  ThreadCollection runNotifierBuild(
    covariant ThreadViewModel notifier,
  ) {
    return notifier.build(
      databaseProps: databaseProps,
      spoolTextEditingController: spoolTextEditingController,
    );
  }

  @override
  Override overrideWith(ThreadViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: ThreadViewModelProvider._internal(
        () => create()
          ..databaseProps = databaseProps
          ..spoolTextEditingController = spoolTextEditingController,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        databaseProps: databaseProps,
        spoolTextEditingController: spoolTextEditingController,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<ThreadViewModel, ThreadCollection>
      createElement() {
    return _ThreadViewModelProviderElement(this);
  }

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
}

mixin ThreadViewModelRef on AutoDisposeNotifierProviderRef<ThreadCollection> {
  /// The parameter `databaseProps` of this provider.
  ({DatabaseManager databaseManager, int id}) get databaseProps;

  /// The parameter `spoolTextEditingController` of this provider.
  TextEditingController get spoolTextEditingController;
}

class _ThreadViewModelProviderElement
    extends AutoDisposeNotifierProviderElement<ThreadViewModel,
        ThreadCollection> with ThreadViewModelRef {
  _ThreadViewModelProviderElement(super.provider);

  @override
  ({DatabaseManager databaseManager, int id}) get databaseProps =>
      (origin as ThreadViewModelProvider).databaseProps;
  @override
  TextEditingController get spoolTextEditingController =>
      (origin as ThreadViewModelProvider).spoolTextEditingController;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
