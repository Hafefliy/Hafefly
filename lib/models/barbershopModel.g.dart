// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barbershopModel.dart';

// **************************************************************************
// CollectionGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

class _Sentinel {
  const _Sentinel();
}

const _sentinel = _Sentinel();

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class BarbershopCollectionReference
    implements
        BarbershopQuery,
        FirestoreCollectionReference<BarbershopQuerySnapshot> {
  factory BarbershopCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$BarbershopCollectionReference;

  static Barbershop fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return Barbershop.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    Barbershop value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  @override
  BarbershopDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<BarbershopDocumentReference> add(Barbershop value);
}

class _$BarbershopCollectionReference extends _$BarbershopQuery
    implements BarbershopCollectionReference {
  factory _$BarbershopCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$BarbershopCollectionReference._(
      firestore.collection('barbershops').withConverter(
            fromFirestore: BarbershopCollectionReference.fromFirestore,
            toFirestore: BarbershopCollectionReference.toFirestore,
          ),
    );
  }

  _$BarbershopCollectionReference._(
    CollectionReference<Barbershop> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<Barbershop> get reference =>
      super.reference as CollectionReference<Barbershop>;

  @override
  BarbershopDocumentReference doc([String? id]) {
    return BarbershopDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<BarbershopDocumentReference> add(Barbershop value) {
    return reference.add(value).then((ref) => BarbershopDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$BarbershopCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class BarbershopDocumentReference
    extends FirestoreDocumentReference<BarbershopDocumentSnapshot> {
  factory BarbershopDocumentReference(DocumentReference<Barbershop> reference) =
      _$BarbershopDocumentReference;

  DocumentReference<Barbershop> get reference;

  /// A reference to the [BarbershopCollectionReference] containing this document.
  BarbershopCollectionReference get parent {
    return _$BarbershopCollectionReference(reference.firestore);
  }

  late final BarberCollectionReference barbers = _$BarberCollectionReference(
    reference,
  );

  @override
  Stream<BarbershopDocumentSnapshot> snapshots();

  @override
  Future<BarbershopDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String barbershopUID,
    String name,
    double rating,
    bool vip,
    String location,
    double latitude,
    double longitude,
    String open,
    String close,
    bool isLiked,
    int fade,
    int razor,
    int scissors,
    int beard,
    int hairdryer,
    int straightener,
  });

  Future<void> set(Barbershop value);
}

class _$BarbershopDocumentReference
    extends FirestoreDocumentReference<BarbershopDocumentSnapshot>
    implements BarbershopDocumentReference {
  _$BarbershopDocumentReference(this.reference);

  @override
  final DocumentReference<Barbershop> reference;

  /// A reference to the [BarbershopCollectionReference] containing this document.
  BarbershopCollectionReference get parent {
    return _$BarbershopCollectionReference(reference.firestore);
  }

  late final BarberCollectionReference barbers = _$BarberCollectionReference(
    reference,
  );

  @override
  Stream<BarbershopDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return BarbershopDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<BarbershopDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return BarbershopDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<void> delete() {
    return reference.delete();
  }

  Future<void> update({
    Object? barbershopUID = _sentinel,
    Object? name = _sentinel,
    Object? rating = _sentinel,
    Object? vip = _sentinel,
    Object? location = _sentinel,
    Object? latitude = _sentinel,
    Object? longitude = _sentinel,
    Object? open = _sentinel,
    Object? close = _sentinel,
    Object? isLiked = _sentinel,
    Object? fade = _sentinel,
    Object? razor = _sentinel,
    Object? scissors = _sentinel,
    Object? beard = _sentinel,
    Object? hairdryer = _sentinel,
    Object? straightener = _sentinel,
  }) async {
    final json = {
      if (barbershopUID != _sentinel) "barbershopUID": barbershopUID as String,
      if (name != _sentinel) "name": name as String,
      if (rating != _sentinel) "rating": rating as double,
      if (vip != _sentinel) "vip": vip as bool,
      if (location != _sentinel) "location": location as String,
      if (latitude != _sentinel) "latitude": latitude as double,
      if (longitude != _sentinel) "longitude": longitude as double,
      if (open != _sentinel) "open": open as String,
      if (close != _sentinel) "close": close as String,
      if (isLiked != _sentinel) "isLiked": isLiked as bool,
      if (fade != _sentinel) "fade": fade as int,
      if (razor != _sentinel) "razor": razor as int,
      if (scissors != _sentinel) "scissors": scissors as int,
      if (beard != _sentinel) "beard": beard as int,
      if (hairdryer != _sentinel) "hairdryer": hairdryer as int,
      if (straightener != _sentinel) "straightener": straightener as int,
    };

    return reference.update(json);
  }

  Future<void> set(Barbershop value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is BarbershopDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class BarbershopDocumentSnapshot extends FirestoreDocumentSnapshot {
  BarbershopDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<Barbershop> snapshot;

  @override
  BarbershopDocumentReference get reference {
    return BarbershopDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Barbershop? data;
}

abstract class BarbershopQuery
    implements QueryReference<BarbershopQuerySnapshot> {
  @override
  BarbershopQuery limit(int limit);

  @override
  BarbershopQuery limitToLast(int limit);

  BarbershopQuery whereBarbershopUID({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  BarbershopQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  BarbershopQuery whereRating({
    double? isEqualTo,
    double? isNotEqualTo,
    double? isLessThan,
    double? isLessThanOrEqualTo,
    double? isGreaterThan,
    double? isGreaterThanOrEqualTo,
    bool? isNull,
    List<double>? whereIn,
    List<double>? whereNotIn,
  });
  BarbershopQuery whereVip({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool>? whereIn,
    List<bool>? whereNotIn,
  });
  BarbershopQuery whereLocation({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  BarbershopQuery whereLatitude({
    double? isEqualTo,
    double? isNotEqualTo,
    double? isLessThan,
    double? isLessThanOrEqualTo,
    double? isGreaterThan,
    double? isGreaterThanOrEqualTo,
    bool? isNull,
    List<double>? whereIn,
    List<double>? whereNotIn,
  });
  BarbershopQuery whereLongitude({
    double? isEqualTo,
    double? isNotEqualTo,
    double? isLessThan,
    double? isLessThanOrEqualTo,
    double? isGreaterThan,
    double? isGreaterThanOrEqualTo,
    bool? isNull,
    List<double>? whereIn,
    List<double>? whereNotIn,
  });
  BarbershopQuery whereOpen({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  BarbershopQuery whereClose({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  BarbershopQuery whereIsLiked({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool>? whereIn,
    List<bool>? whereNotIn,
  });
  BarbershopQuery whereFade({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  });
  BarbershopQuery whereRazor({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  });
  BarbershopQuery whereScissors({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  });
  BarbershopQuery whereBeard({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  });
  BarbershopQuery whereHairdryer({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  });
  BarbershopQuery whereStraightener({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  });

  BarbershopQuery orderByBarbershopUID({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  });

  BarbershopQuery orderByName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  });

  BarbershopQuery orderByRating({
    bool descending = false,
    double startAt,
    double startAfter,
    double endAt,
    double endBefore,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  });

  BarbershopQuery orderByVip({
    bool descending = false,
    bool startAt,
    bool startAfter,
    bool endAt,
    bool endBefore,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  });

  BarbershopQuery orderByLocation({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  });

  BarbershopQuery orderByLatitude({
    bool descending = false,
    double startAt,
    double startAfter,
    double endAt,
    double endBefore,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  });

  BarbershopQuery orderByLongitude({
    bool descending = false,
    double startAt,
    double startAfter,
    double endAt,
    double endBefore,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  });

  BarbershopQuery orderByOpen({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  });

  BarbershopQuery orderByClose({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  });

  BarbershopQuery orderByIsLiked({
    bool descending = false,
    bool startAt,
    bool startAfter,
    bool endAt,
    bool endBefore,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  });

  BarbershopQuery orderByFade({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  });

  BarbershopQuery orderByRazor({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  });

  BarbershopQuery orderByScissors({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  });

  BarbershopQuery orderByBeard({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  });

  BarbershopQuery orderByHairdryer({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  });

  BarbershopQuery orderByStraightener({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  });
}

class _$BarbershopQuery extends QueryReference<BarbershopQuerySnapshot>
    implements BarbershopQuery {
  _$BarbershopQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<Barbershop> reference;

  BarbershopQuerySnapshot _decodeSnapshot(
    QuerySnapshot<Barbershop> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return BarbershopQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<BarbershopDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: BarbershopDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return BarbershopQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<BarbershopQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<BarbershopQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  BarbershopQuery limit(int limit) {
    return _$BarbershopQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  BarbershopQuery limitToLast(int limit) {
    return _$BarbershopQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  BarbershopQuery whereBarbershopUID({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$BarbershopQuery(
      reference.where(
        'barbershopUID',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  BarbershopQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$BarbershopQuery(
      reference.where(
        'name',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  BarbershopQuery whereRating({
    double? isEqualTo,
    double? isNotEqualTo,
    double? isLessThan,
    double? isLessThanOrEqualTo,
    double? isGreaterThan,
    double? isGreaterThanOrEqualTo,
    bool? isNull,
    List<double>? whereIn,
    List<double>? whereNotIn,
  }) {
    return _$BarbershopQuery(
      reference.where(
        'rating',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  BarbershopQuery whereVip({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool>? whereIn,
    List<bool>? whereNotIn,
  }) {
    return _$BarbershopQuery(
      reference.where(
        'vip',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  BarbershopQuery whereLocation({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$BarbershopQuery(
      reference.where(
        'location',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  BarbershopQuery whereLatitude({
    double? isEqualTo,
    double? isNotEqualTo,
    double? isLessThan,
    double? isLessThanOrEqualTo,
    double? isGreaterThan,
    double? isGreaterThanOrEqualTo,
    bool? isNull,
    List<double>? whereIn,
    List<double>? whereNotIn,
  }) {
    return _$BarbershopQuery(
      reference.where(
        'latitude',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  BarbershopQuery whereLongitude({
    double? isEqualTo,
    double? isNotEqualTo,
    double? isLessThan,
    double? isLessThanOrEqualTo,
    double? isGreaterThan,
    double? isGreaterThanOrEqualTo,
    bool? isNull,
    List<double>? whereIn,
    List<double>? whereNotIn,
  }) {
    return _$BarbershopQuery(
      reference.where(
        'longitude',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  BarbershopQuery whereOpen({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$BarbershopQuery(
      reference.where(
        'open',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  BarbershopQuery whereClose({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$BarbershopQuery(
      reference.where(
        'close',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  BarbershopQuery whereIsLiked({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool>? whereIn,
    List<bool>? whereNotIn,
  }) {
    return _$BarbershopQuery(
      reference.where(
        'isLiked',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  BarbershopQuery whereFade({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  }) {
    return _$BarbershopQuery(
      reference.where(
        'fade',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  BarbershopQuery whereRazor({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  }) {
    return _$BarbershopQuery(
      reference.where(
        'razor',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  BarbershopQuery whereScissors({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  }) {
    return _$BarbershopQuery(
      reference.where(
        'scissors',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  BarbershopQuery whereBeard({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  }) {
    return _$BarbershopQuery(
      reference.where(
        'beard',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  BarbershopQuery whereHairdryer({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  }) {
    return _$BarbershopQuery(
      reference.where(
        'hairdryer',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  BarbershopQuery whereStraightener({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  }) {
    return _$BarbershopQuery(
      reference.where(
        'straightener',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  BarbershopQuery orderByBarbershopUID({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('barbershopUID', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$BarbershopQuery(query, _collection);
  }

  BarbershopQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('name', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$BarbershopQuery(query, _collection);
  }

  BarbershopQuery orderByRating({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('rating', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$BarbershopQuery(query, _collection);
  }

  BarbershopQuery orderByVip({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('vip', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$BarbershopQuery(query, _collection);
  }

  BarbershopQuery orderByLocation({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('location', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$BarbershopQuery(query, _collection);
  }

  BarbershopQuery orderByLatitude({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('latitude', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$BarbershopQuery(query, _collection);
  }

  BarbershopQuery orderByLongitude({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('longitude', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$BarbershopQuery(query, _collection);
  }

  BarbershopQuery orderByOpen({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('open', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$BarbershopQuery(query, _collection);
  }

  BarbershopQuery orderByClose({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('close', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$BarbershopQuery(query, _collection);
  }

  BarbershopQuery orderByIsLiked({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('isLiked', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$BarbershopQuery(query, _collection);
  }

  BarbershopQuery orderByFade({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('fade', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$BarbershopQuery(query, _collection);
  }

  BarbershopQuery orderByRazor({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('razor', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$BarbershopQuery(query, _collection);
  }

  BarbershopQuery orderByScissors({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('scissors', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$BarbershopQuery(query, _collection);
  }

  BarbershopQuery orderByBeard({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('beard', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$BarbershopQuery(query, _collection);
  }

  BarbershopQuery orderByHairdryer({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('hairdryer', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$BarbershopQuery(query, _collection);
  }

  BarbershopQuery orderByStraightener({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('straightener', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$BarbershopQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$BarbershopQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class BarbershopQuerySnapshot
    extends FirestoreQuerySnapshot<BarbershopQueryDocumentSnapshot> {
  BarbershopQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<Barbershop> snapshot;

  @override
  final List<BarbershopQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<BarbershopDocumentSnapshot>> docChanges;
}

class BarbershopQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
    implements BarbershopDocumentSnapshot {
  BarbershopQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<Barbershop> snapshot;

  @override
  BarbershopDocumentReference get reference {
    return BarbershopDocumentReference(snapshot.reference);
  }

  @override
  final Barbershop data;
}

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class BarberCollectionReference
    implements BarberQuery, FirestoreCollectionReference<BarberQuerySnapshot> {
  factory BarberCollectionReference(
    DocumentReference<Barbershop> parent,
  ) = _$BarberCollectionReference;

  static Barber fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return Barber.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    Barber value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  /// A reference to the containing [BarbershopDocumentReference] if this is a subcollection.
  BarbershopDocumentReference get parent;

  @override
  BarberDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<BarberDocumentReference> add(Barber value);
}

class _$BarberCollectionReference extends _$BarberQuery
    implements BarberCollectionReference {
  factory _$BarberCollectionReference(
    DocumentReference<Barbershop> parent,
  ) {
    return _$BarberCollectionReference._(
      BarbershopDocumentReference(parent),
      parent.collection('barbers').withConverter(
            fromFirestore: BarberCollectionReference.fromFirestore,
            toFirestore: BarberCollectionReference.toFirestore,
          ),
    );
  }

  _$BarberCollectionReference._(
    this.parent,
    CollectionReference<Barber> reference,
  ) : super(reference, reference);

  @override
  final BarbershopDocumentReference parent;

  String get path => reference.path;

  @override
  CollectionReference<Barber> get reference =>
      super.reference as CollectionReference<Barber>;

  @override
  BarberDocumentReference doc([String? id]) {
    return BarberDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<BarberDocumentReference> add(Barber value) {
    return reference.add(value).then((ref) => BarberDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$BarberCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class BarberDocumentReference
    extends FirestoreDocumentReference<BarberDocumentSnapshot> {
  factory BarberDocumentReference(DocumentReference<Barber> reference) =
      _$BarberDocumentReference;

  DocumentReference<Barber> get reference;

  /// A reference to the [BarberCollectionReference] containing this document.
  BarberCollectionReference get parent {
    return _$BarberCollectionReference(
      reference.parent.parent!.withConverter<Barbershop>(
        fromFirestore: BarbershopCollectionReference.fromFirestore,
        toFirestore: BarbershopCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<BarberDocumentSnapshot> snapshots();

  @override
  Future<BarberDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String barberUID,
    String firstname,
    int haircutsDone,
    String lastname,
    int experience,
    double rating,
    String instagram,
    String barbershopName,
    String barbershopUID,
    String bio,
    String phoneNumber,
    String workingHours,
  });

  Future<void> set(Barber value);
}

class _$BarberDocumentReference
    extends FirestoreDocumentReference<BarberDocumentSnapshot>
    implements BarberDocumentReference {
  _$BarberDocumentReference(this.reference);

  @override
  final DocumentReference<Barber> reference;

  /// A reference to the [BarberCollectionReference] containing this document.
  BarberCollectionReference get parent {
    return _$BarberCollectionReference(
      reference.parent.parent!.withConverter<Barbershop>(
        fromFirestore: BarbershopCollectionReference.fromFirestore,
        toFirestore: BarbershopCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<BarberDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return BarberDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<BarberDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return BarberDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<void> delete() {
    return reference.delete();
  }

  Future<void> update({
    Object? barberUID = _sentinel,
    Object? firstname = _sentinel,
    Object? haircutsDone = _sentinel,
    Object? lastname = _sentinel,
    Object? experience = _sentinel,
    Object? rating = _sentinel,
    Object? instagram = _sentinel,
    Object? barbershopName = _sentinel,
    Object? barbershopUID = _sentinel,
    Object? bio = _sentinel,
    Object? phoneNumber = _sentinel,
    Object? workingHours = _sentinel,
  }) async {
    final json = {
      if (barberUID != _sentinel) "barberUID": barberUID as String,
      if (firstname != _sentinel) "firstname": firstname as String,
      if (haircutsDone != _sentinel) "haircutsDone": haircutsDone as int,
      if (lastname != _sentinel) "lastname": lastname as String,
      if (experience != _sentinel) "experience": experience as int,
      if (rating != _sentinel) "rating": rating as double,
      if (instagram != _sentinel) "instagram": instagram as String,
      if (barbershopName != _sentinel)
        "barbershopName": barbershopName as String,
      if (barbershopUID != _sentinel) "barbershopUID": barbershopUID as String,
      if (bio != _sentinel) "bio": bio as String,
      if (phoneNumber != _sentinel) "phoneNumber": phoneNumber as String,
      if (workingHours != _sentinel) "workingHours": workingHours as String,
    };

    return reference.update(json);
  }

  Future<void> set(Barber value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is BarberDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class BarberDocumentSnapshot extends FirestoreDocumentSnapshot {
  BarberDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<Barber> snapshot;

  @override
  BarberDocumentReference get reference {
    return BarberDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Barber? data;
}

abstract class BarberQuery implements QueryReference<BarberQuerySnapshot> {
  @override
  BarberQuery limit(int limit);

  @override
  BarberQuery limitToLast(int limit);

  BarberQuery whereBarberUID({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  BarberQuery whereFirstname({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  BarberQuery whereHaircutsDone({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  });
  BarberQuery whereLastname({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  BarberQuery whereExperience({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  });
  BarberQuery whereRating({
    double? isEqualTo,
    double? isNotEqualTo,
    double? isLessThan,
    double? isLessThanOrEqualTo,
    double? isGreaterThan,
    double? isGreaterThanOrEqualTo,
    bool? isNull,
    List<double>? whereIn,
    List<double>? whereNotIn,
  });
  BarberQuery whereInstagram({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  BarberQuery whereBarbershopName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  BarberQuery whereBarbershopUID({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  BarberQuery whereBio({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  BarberQuery wherePhoneNumber({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  BarberQuery whereWorkingHours({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });

  BarberQuery orderByBarberUID({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    BarberDocumentSnapshot? startAtDocument,
    BarberDocumentSnapshot? endAtDocument,
    BarberDocumentSnapshot? endBeforeDocument,
    BarberDocumentSnapshot? startAfterDocument,
  });

  BarberQuery orderByFirstname({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    BarberDocumentSnapshot? startAtDocument,
    BarberDocumentSnapshot? endAtDocument,
    BarberDocumentSnapshot? endBeforeDocument,
    BarberDocumentSnapshot? startAfterDocument,
  });

  BarberQuery orderByHaircutsDone({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    BarberDocumentSnapshot? startAtDocument,
    BarberDocumentSnapshot? endAtDocument,
    BarberDocumentSnapshot? endBeforeDocument,
    BarberDocumentSnapshot? startAfterDocument,
  });

  BarberQuery orderByLastname({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    BarberDocumentSnapshot? startAtDocument,
    BarberDocumentSnapshot? endAtDocument,
    BarberDocumentSnapshot? endBeforeDocument,
    BarberDocumentSnapshot? startAfterDocument,
  });

  BarberQuery orderByExperience({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    BarberDocumentSnapshot? startAtDocument,
    BarberDocumentSnapshot? endAtDocument,
    BarberDocumentSnapshot? endBeforeDocument,
    BarberDocumentSnapshot? startAfterDocument,
  });

  BarberQuery orderByRating({
    bool descending = false,
    double startAt,
    double startAfter,
    double endAt,
    double endBefore,
    BarberDocumentSnapshot? startAtDocument,
    BarberDocumentSnapshot? endAtDocument,
    BarberDocumentSnapshot? endBeforeDocument,
    BarberDocumentSnapshot? startAfterDocument,
  });

  BarberQuery orderByInstagram({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    BarberDocumentSnapshot? startAtDocument,
    BarberDocumentSnapshot? endAtDocument,
    BarberDocumentSnapshot? endBeforeDocument,
    BarberDocumentSnapshot? startAfterDocument,
  });

  BarberQuery orderByBarbershopName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    BarberDocumentSnapshot? startAtDocument,
    BarberDocumentSnapshot? endAtDocument,
    BarberDocumentSnapshot? endBeforeDocument,
    BarberDocumentSnapshot? startAfterDocument,
  });

  BarberQuery orderByBarbershopUID({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    BarberDocumentSnapshot? startAtDocument,
    BarberDocumentSnapshot? endAtDocument,
    BarberDocumentSnapshot? endBeforeDocument,
    BarberDocumentSnapshot? startAfterDocument,
  });

  BarberQuery orderByBio({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    BarberDocumentSnapshot? startAtDocument,
    BarberDocumentSnapshot? endAtDocument,
    BarberDocumentSnapshot? endBeforeDocument,
    BarberDocumentSnapshot? startAfterDocument,
  });

  BarberQuery orderByPhoneNumber({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    BarberDocumentSnapshot? startAtDocument,
    BarberDocumentSnapshot? endAtDocument,
    BarberDocumentSnapshot? endBeforeDocument,
    BarberDocumentSnapshot? startAfterDocument,
  });

  BarberQuery orderByWorkingHours({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    BarberDocumentSnapshot? startAtDocument,
    BarberDocumentSnapshot? endAtDocument,
    BarberDocumentSnapshot? endBeforeDocument,
    BarberDocumentSnapshot? startAfterDocument,
  });
}

class _$BarberQuery extends QueryReference<BarberQuerySnapshot>
    implements BarberQuery {
  _$BarberQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<Barber> reference;

  BarberQuerySnapshot _decodeSnapshot(
    QuerySnapshot<Barber> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return BarberQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<BarberDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: BarberDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return BarberQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<BarberQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<BarberQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  BarberQuery limit(int limit) {
    return _$BarberQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  BarberQuery limitToLast(int limit) {
    return _$BarberQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  BarberQuery whereBarberUID({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$BarberQuery(
      reference.where(
        'barberUID',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  BarberQuery whereFirstname({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$BarberQuery(
      reference.where(
        'firstname',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  BarberQuery whereHaircutsDone({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  }) {
    return _$BarberQuery(
      reference.where(
        'haircutsDone',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  BarberQuery whereLastname({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$BarberQuery(
      reference.where(
        'lastname',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  BarberQuery whereExperience({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  }) {
    return _$BarberQuery(
      reference.where(
        'experience',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  BarberQuery whereRating({
    double? isEqualTo,
    double? isNotEqualTo,
    double? isLessThan,
    double? isLessThanOrEqualTo,
    double? isGreaterThan,
    double? isGreaterThanOrEqualTo,
    bool? isNull,
    List<double>? whereIn,
    List<double>? whereNotIn,
  }) {
    return _$BarberQuery(
      reference.where(
        'rating',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  BarberQuery whereInstagram({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$BarberQuery(
      reference.where(
        'instagram',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  BarberQuery whereBarbershopName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$BarberQuery(
      reference.where(
        'barbershopName',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  BarberQuery whereBarbershopUID({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$BarberQuery(
      reference.where(
        'barbershopUID',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  BarberQuery whereBio({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$BarberQuery(
      reference.where(
        'bio',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  BarberQuery wherePhoneNumber({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$BarberQuery(
      reference.where(
        'phoneNumber',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  BarberQuery whereWorkingHours({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$BarberQuery(
      reference.where(
        'workingHours',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  BarberQuery orderByBarberUID({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    BarberDocumentSnapshot? startAtDocument,
    BarberDocumentSnapshot? endAtDocument,
    BarberDocumentSnapshot? endBeforeDocument,
    BarberDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('barberUID', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$BarberQuery(query, _collection);
  }

  BarberQuery orderByFirstname({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    BarberDocumentSnapshot? startAtDocument,
    BarberDocumentSnapshot? endAtDocument,
    BarberDocumentSnapshot? endBeforeDocument,
    BarberDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('firstname', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$BarberQuery(query, _collection);
  }

  BarberQuery orderByHaircutsDone({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    BarberDocumentSnapshot? startAtDocument,
    BarberDocumentSnapshot? endAtDocument,
    BarberDocumentSnapshot? endBeforeDocument,
    BarberDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('haircutsDone', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$BarberQuery(query, _collection);
  }

  BarberQuery orderByLastname({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    BarberDocumentSnapshot? startAtDocument,
    BarberDocumentSnapshot? endAtDocument,
    BarberDocumentSnapshot? endBeforeDocument,
    BarberDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('lastname', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$BarberQuery(query, _collection);
  }

  BarberQuery orderByExperience({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    BarberDocumentSnapshot? startAtDocument,
    BarberDocumentSnapshot? endAtDocument,
    BarberDocumentSnapshot? endBeforeDocument,
    BarberDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('experience', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$BarberQuery(query, _collection);
  }

  BarberQuery orderByRating({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    BarberDocumentSnapshot? startAtDocument,
    BarberDocumentSnapshot? endAtDocument,
    BarberDocumentSnapshot? endBeforeDocument,
    BarberDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('rating', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$BarberQuery(query, _collection);
  }

  BarberQuery orderByInstagram({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    BarberDocumentSnapshot? startAtDocument,
    BarberDocumentSnapshot? endAtDocument,
    BarberDocumentSnapshot? endBeforeDocument,
    BarberDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('instagram', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$BarberQuery(query, _collection);
  }

  BarberQuery orderByBarbershopName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    BarberDocumentSnapshot? startAtDocument,
    BarberDocumentSnapshot? endAtDocument,
    BarberDocumentSnapshot? endBeforeDocument,
    BarberDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('barbershopName', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$BarberQuery(query, _collection);
  }

  BarberQuery orderByBarbershopUID({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    BarberDocumentSnapshot? startAtDocument,
    BarberDocumentSnapshot? endAtDocument,
    BarberDocumentSnapshot? endBeforeDocument,
    BarberDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('barbershopUID', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$BarberQuery(query, _collection);
  }

  BarberQuery orderByBio({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    BarberDocumentSnapshot? startAtDocument,
    BarberDocumentSnapshot? endAtDocument,
    BarberDocumentSnapshot? endBeforeDocument,
    BarberDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('bio', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$BarberQuery(query, _collection);
  }

  BarberQuery orderByPhoneNumber({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    BarberDocumentSnapshot? startAtDocument,
    BarberDocumentSnapshot? endAtDocument,
    BarberDocumentSnapshot? endBeforeDocument,
    BarberDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('phoneNumber', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$BarberQuery(query, _collection);
  }

  BarberQuery orderByWorkingHours({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    BarberDocumentSnapshot? startAtDocument,
    BarberDocumentSnapshot? endAtDocument,
    BarberDocumentSnapshot? endBeforeDocument,
    BarberDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('workingHours', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$BarberQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$BarberQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class BarberQuerySnapshot
    extends FirestoreQuerySnapshot<BarberQueryDocumentSnapshot> {
  BarberQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<Barber> snapshot;

  @override
  final List<BarberQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<BarberDocumentSnapshot>> docChanges;
}

class BarberQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
    implements BarberDocumentSnapshot {
  BarberQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<Barber> snapshot;

  @override
  BarberDocumentReference get reference {
    return BarberDocumentReference(snapshot.reference);
  }

  @override
  final Barber data;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Barbershop _$BarbershopFromJson(Map<String, dynamic> json) => Barbershop(
      json['isLiked'] as bool? ?? false,
      barbershopUID: json['barbershopUID'] as String,
      name: json['name'] as String,
      rating: (json['rating'] as num).toDouble(),
      vip: json['vip'] as bool,
      location: json['location'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      open: json['open'] as String,
      close: json['close'] as String,
      fade: json['fade'] as int,
      razor: json['razor'] as int,
      scissors: json['scissors'] as int,
      beard: json['beard'] as int,
      hairdryer: json['hairdryer'] as int,
      straightener: json['straightener'] as int,
    );

Map<String, dynamic> _$BarbershopToJson(Barbershop instance) =>
    <String, dynamic>{
      'barbershopUID': instance.barbershopUID,
      'name': instance.name,
      'rating': instance.rating,
      'vip': instance.vip,
      'location': instance.location,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'open': instance.open,
      'close': instance.close,
      'isLiked': instance.isLiked,
      'fade': instance.fade,
      'razor': instance.razor,
      'scissors': instance.scissors,
      'beard': instance.beard,
      'hairdryer': instance.hairdryer,
      'straightener': instance.straightener,
    };
