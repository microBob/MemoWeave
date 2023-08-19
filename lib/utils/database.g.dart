// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$databaseInstanceHash() => r'a5fbf7f452b1bdf602d449b1e9a1937abf29ef43';

/// Returns access to the [Isar] database.
///
/// Primarily used by other providers that handle interaction.
///
/// Copied from [databaseInstance].
@ProviderFor(databaseInstance)
final databaseInstanceProvider = FutureProvider<Isar>.internal(
  databaseInstance,
  name: r'databaseInstanceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$databaseInstanceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DatabaseInstanceRef = FutureProviderRef<Isar>;
String _$databaseManagerInstanceHash() =>
    r'c146de48f790217bedaf8add26fbf9cd33840ce8';

/// See also [databaseManagerInstance].
@ProviderFor(databaseManagerInstance)
final databaseManagerInstanceProvider =
    AutoDisposeFutureProvider<DatabaseManager>.internal(
  databaseManagerInstance,
  name: r'databaseManagerInstanceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$databaseManagerInstanceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DatabaseManagerInstanceRef
    = AutoDisposeFutureProviderRef<DatabaseManager>;
String _$getBlockCollectionByIdHash() =>
    r'6868aed7df95afa4c4c9beb04ab360220ce01327';

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

typedef GetBlockCollectionByIdRef
    = AutoDisposeFutureProviderRef<BlockCollection?>;

/// See also [getBlockCollectionById].
@ProviderFor(getBlockCollectionById)
const getBlockCollectionByIdProvider = GetBlockCollectionByIdFamily();

/// See also [getBlockCollectionById].
class GetBlockCollectionByIdFamily
    extends Family<AsyncValue<BlockCollection?>> {
  /// See also [getBlockCollectionById].
  const GetBlockCollectionByIdFamily();

  /// See also [getBlockCollectionById].
  GetBlockCollectionByIdProvider call({
    required int id,
  }) {
    return GetBlockCollectionByIdProvider(
      id: id,
    );
  }

  @override
  GetBlockCollectionByIdProvider getProviderOverride(
    covariant GetBlockCollectionByIdProvider provider,
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
  String? get name => r'getBlockCollectionByIdProvider';
}

/// See also [getBlockCollectionById].
class GetBlockCollectionByIdProvider
    extends AutoDisposeFutureProvider<BlockCollection?> {
  /// See also [getBlockCollectionById].
  GetBlockCollectionByIdProvider({
    required this.id,
  }) : super.internal(
          (ref) => getBlockCollectionById(
            ref,
            id: id,
          ),
          from: getBlockCollectionByIdProvider,
          name: r'getBlockCollectionByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getBlockCollectionByIdHash,
          dependencies: GetBlockCollectionByIdFamily._dependencies,
          allTransitiveDependencies:
              GetBlockCollectionByIdFamily._allTransitiveDependencies,
        );

  final int id;

  @override
  bool operator ==(Object other) {
    return other is GetBlockCollectionByIdProvider && other.id == id;
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
