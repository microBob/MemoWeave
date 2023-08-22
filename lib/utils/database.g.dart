// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$databaseInstanceHash() => r'47f576185ab91fb73f510282c93b0e5c98ca8e8e';

/// Provider for the [Isar] database.
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
String _$databaseManagerHash() => r'736ce63f0db2548c2578ad120eddb0c25b97d67d';

/// Provider for the instance of the [DatabaseManager].
///
/// Uses the current open [Isar] instance.
///
/// Copied from [databaseManager].
@ProviderFor(databaseManager)
final databaseManagerProvider =
    AutoDisposeFutureProvider<DatabaseManager>.internal(
  databaseManager,
  name: r'databaseManagerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$databaseManagerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DatabaseManagerRef = AutoDisposeFutureProviderRef<DatabaseManager>;
String _$getBlockCollectionByIdHash() =>
    r'503f11f95937a8c46d3ef35f5425a7eb9496c8a3';

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

/// Handles retrieving a [BlockCollection] with the given [Id].
///
/// Returns null if not found.
///
/// Copied from [getBlockCollectionById].
@ProviderFor(getBlockCollectionById)
const getBlockCollectionByIdProvider = GetBlockCollectionByIdFamily();

/// Handles retrieving a [BlockCollection] with the given [Id].
///
/// Returns null if not found.
///
/// Copied from [getBlockCollectionById].
class GetBlockCollectionByIdFamily
    extends Family<AsyncValue<BlockCollection?>> {
  /// Handles retrieving a [BlockCollection] with the given [Id].
  ///
  /// Returns null if not found.
  ///
  /// Copied from [getBlockCollectionById].
  const GetBlockCollectionByIdFamily();

  /// Handles retrieving a [BlockCollection] with the given [Id].
  ///
  /// Returns null if not found.
  ///
  /// Copied from [getBlockCollectionById].
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

/// Handles retrieving a [BlockCollection] with the given [Id].
///
/// Returns null if not found.
///
/// Copied from [getBlockCollectionById].
class GetBlockCollectionByIdProvider
    extends AutoDisposeFutureProvider<BlockCollection?> {
  /// Handles retrieving a [BlockCollection] with the given [Id].
  ///
  /// Returns null if not found.
  ///
  /// Copied from [getBlockCollectionById].
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

String _$spoolsHash() => r'b82f8139e589e5792e04e3894d02bc312631336c';

/// Handles retrieving all spool names.
///
/// Copied from [spools].
@ProviderFor(spools)
final spoolsProvider = AutoDisposeFutureProvider<List<String>>.internal(
  spools,
  name: r'spoolsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$spoolsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SpoolsRef = AutoDisposeFutureProviderRef<List<String>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
