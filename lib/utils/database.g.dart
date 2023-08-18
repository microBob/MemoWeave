// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$databaseHash() => r'0f1b0cc6897d0e8d8445f0b5c65411e783dac852';

/// Returns access to the [Isar] database.
///
/// Primarily used by other providers that handle interaction.
///
/// Copied from [database].
@ProviderFor(database)
final databaseProvider = AutoDisposeFutureProvider<Isar>.internal(
  database,
  name: r'databaseProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$databaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DatabaseRef = AutoDisposeFutureProviderRef<Isar>;

String _$blockCollectionByIdHash() =>
    r'5b20731104d662ea4969eef9fe615598e6f9a404';

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

/// Returns a [BlockCollection] with the given [id].
///
/// Will return null if unable to return.
///
/// Copied from [blockCollectionById].
@ProviderFor(blockCollectionById)
const blockCollectionByIdProvider = BlockCollectionByIdFamily();

/// Returns a [BlockCollection] with the given [id].
///
/// Will return null if unable to return.
///
/// Copied from [blockCollectionById].
class BlockCollectionByIdFamily extends Family<AsyncValue<BlockCollection?>> {
  /// Returns a [BlockCollection] with the given [id].
  ///
  /// Will return null if unable to return.
  ///
  /// Copied from [blockCollectionById].
  const BlockCollectionByIdFamily();

  /// Returns a [BlockCollection] with the given [id].
  ///
  /// Will return null if unable to return.
  ///
  /// Copied from [blockCollectionById].
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

/// Returns a [BlockCollection] with the given [id].
///
/// Will return null if unable to return.
///
/// Copied from [blockCollectionById].
class BlockCollectionByIdProvider
    extends AutoDisposeFutureProvider<BlockCollection?> {
  /// Returns a [BlockCollection] with the given [id].
  ///
  /// Will return null if unable to return.
  ///
  /// Copied from [blockCollectionById].
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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
