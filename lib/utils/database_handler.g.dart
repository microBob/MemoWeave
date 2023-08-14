// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_handler.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$blockCollectionByIdHash() =>
    r'628c2abfa730cb83419c67c3f102e8090fb708f7';

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

typedef BlockCollectionByIdRef = AutoDisposeFutureProviderRef<BlockCollection?>;

/// See also [blockCollectionById].
@ProviderFor(blockCollectionById)
const blockCollectionByIdProvider = BlockCollectionByIdFamily();

/// See also [blockCollectionById].
class BlockCollectionByIdFamily extends Family<AsyncValue<BlockCollection?>> {
  /// See also [blockCollectionById].
  const BlockCollectionByIdFamily();

  /// See also [blockCollectionById].
  BlockCollectionByIdProvider call({
    required int id,
  }) {
    return BlockCollectionByIdProvider(
      id: id,
    );
  }

  @override
  BlockCollectionByIdProvider getProviderOverride(
    covariant BlockCollectionByIdProvider provider,
  ) {
    return call(
      id: provider.id,
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
  String? get name => r'blockCollectionByIdProvider';
}

/// See also [blockCollectionById].
class BlockCollectionByIdProvider
    extends AutoDisposeFutureProvider<BlockCollection?> {
  /// See also [blockCollectionById].
  BlockCollectionByIdProvider({
    required this.id,
  }) : super.internal(
          (ref) => blockCollectionById(
            ref,
            id: id,
          ),
          from: blockCollectionByIdProvider,
          name: r'blockCollectionByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$blockCollectionByIdHash,
          dependencies: BlockCollectionByIdFamily._dependencies,
          allTransitiveDependencies:
              BlockCollectionByIdFamily._allTransitiveDependencies,
        );

  final int id;

  @override
  bool operator ==(Object other) {
    return other is BlockCollectionByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$databaseHandlerHash() => r'bdc914dcb3d1e89f10672d0c3120cbe35bb97ba8';

/// See also [DatabaseHandler].
@ProviderFor(DatabaseHandler)
final databaseHandlerProvider =
    AutoDisposeAsyncNotifierProvider<DatabaseHandler, Isar>.internal(
  DatabaseHandler.new,
  name: r'databaseHandlerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$databaseHandlerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DatabaseHandler = AutoDisposeAsyncNotifier<Isar>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
