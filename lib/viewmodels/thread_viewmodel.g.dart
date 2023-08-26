// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thread_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$threadViewModelHash() => r'b5facf745c33527f42c17dba4095ce47872de283';

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
    extends BuildlessAutoDisposeAsyncNotifier<ThreadState> {
  late final ({
    TextEditingController spoolTextEditingController,
    int threadId
  }) props;

  FutureOr<ThreadState> build(
    ({TextEditingController spoolTextEditingController, int threadId}) props,
  );
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
class ThreadViewModelFamily extends Family<AsyncValue<ThreadState>> {
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
  ThreadViewModelProvider call(
    ({TextEditingController spoolTextEditingController, int threadId}) props,
  ) {
    return ThreadViewModelProvider(
      props,
    );
  }

  @override
  ThreadViewModelProvider getProviderOverride(
    covariant ThreadViewModelProvider provider,
  ) {
    return call(
      provider.props,
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
    extends AutoDisposeAsyncNotifierProviderImpl<ThreadViewModel, ThreadState> {
  /// ViewModel for a Thread.
  ///
  /// Used by [ThreadView].
  ///
  /// Copied from [ThreadViewModel].
  ThreadViewModelProvider(
    this.props,
  ) : super.internal(
          () => ThreadViewModel()..props = props,
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

  final ({
    TextEditingController spoolTextEditingController,
    int threadId
  }) props;

  @override
  bool operator ==(Object other) {
    return other is ThreadViewModelProvider && other.props == props;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, props.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<ThreadState> runNotifierBuild(
    covariant ThreadViewModel notifier,
  ) {
    return notifier.build(
      props,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
