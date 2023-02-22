// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barbers.dart';

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
abstract class BarberCollectionReference
    implements BarberQuery, FirestoreCollectionReference<BarberQuerySnapshot> {
  factory BarberCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$BarberCollectionReference;

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

  @override
  BarberDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<BarberDocumentReference> add(Barber value);
}

class _$BarberCollectionReference extends _$BarberQuery
    implements BarberCollectionReference {
  factory _$BarberCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$BarberCollectionReference._(
      firestore.collection('barbers').withConverter(
            fromFirestore: BarberCollectionReference.fromFirestore,
            toFirestore: BarberCollectionReference.toFirestore,
          ),
    );
  }

  _$BarberCollectionReference._(
    CollectionReference<Barber> reference,
  ) : super(reference, reference);

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
    return _$BarberCollectionReference(reference.firestore);
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
    return _$BarberCollectionReference(reference.firestore);
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
// ValidatorGenerator
// **************************************************************************

_$assertBarber(Barber instance) {
  const Min(0).validate(instance.haircutsDone, "haircutsDone");
  const Min(0).validate(instance.experience, "experience");
  const Min(0.0).validate(instance.rating, "rating");
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Barber _$BarberFromJson(Map<String, dynamic> json) => Barber(
      json['haircutsDone'] as int,
      barberUID: json['barberUID'] as String,
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      experience: json['experience'] as int,
      phoneNumber: json['phoneNumber'] as String,
      bio: json['bio'] as String,
      rating: (json['rating'] as num).toDouble(),
      workingHours: json['workingHours'] as String,
      instagram: json['instagram'] as String,
      barbershopName: json['barbershopName'] as String,
      barbershopUID: json['barbershopUID'] as String,
    );

Map<String, dynamic> _$BarberToJson(Barber instance) => <String, dynamic>{
      'barberUID': instance.barberUID,
      'firstname': instance.firstname,
      'haircutsDone': instance.haircutsDone,
      'lastname': instance.lastname,
      'experience': instance.experience,
      'rating': instance.rating,
      'instagram': instance.instagram,
      'barbershopName': instance.barbershopName,
      'barbershopUID': instance.barbershopUID,
      'bio': instance.bio,
      'phoneNumber': instance.phoneNumber,
      'workingHours': instance.workingHours,
    };
