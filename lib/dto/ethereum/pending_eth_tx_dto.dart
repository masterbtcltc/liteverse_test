/// blockHash : null
/// blockNumber : null
/// from : "0x..."
/// gas : "0x7e562"
/// maxPriorityFeePerGas : "0x444380"
/// maxFeePerGas : "0x342570c00"
/// hash : "0x...da64e4"
/// input : "....."
/// nonce : "0x70"
/// to : "0x00....."
/// transactionIndex : null
/// value : "0x0"
/// type : "0x2"
/// accessList : []
/// chainId : "0x1"
/// v : "0x0"
/// r : "0xd..."
/// s : "0x17d...6e6"

class PendingEthTxDto {
  PendingEthTxDto({
    required this.blockHash,
    required this.blockNumber,
    required this.from,
    required this.gas,
    required this.maxPriorityFeePerGas,
    required this.maxFeePerGas,
    required this.hash,
    required this.input,
    required this.nonce,
    required this.to,
    required this.transactionIndex,
    required this.value,
    required this.type,
    required this.accessList,
    required this.chainId,
    required this.v,
    required this.r,
    required this.s,
  });

  factory PendingEthTxDto.fromMap(Map<String, dynamic> map) => PendingEthTxDto(
        blockHash: map['blockHash'] as String?,
        blockNumber: map['blockNumber'] as int?,
        from: map['from'] as String,
        gas: map['gas'] as String,
        maxPriorityFeePerGas: map['maxPriorityFeePerGas'] as String,
        maxFeePerGas: map['maxFeePerGas'] as String,
        hash: map['hash'] as String,
        input: map['input'] as String,
        nonce: map['nonce'] as String,
        to: map['to'] as String,
        transactionIndex: map['transactionIndex'] as int?,
        value: map['value'] as String,
        type: map['type'] as String,
        accessList: map['accessList'] as List? ?? [],
        chainId: map['chainId'] as String,
        v: map['v'] as String,
        r: map['r'] as String,
        s: map['s'] as String,
      );

  final String? blockHash;
  final int? blockNumber;
  final String from;
  final String gas;
  final String maxPriorityFeePerGas;
  final String maxFeePerGas;
  final String hash;
  final String input;
  final String nonce;
  final String to;
  final int? transactionIndex;
  final String value;
  final String type;
  final List<dynamic> accessList;
  final String chainId;
  final String v;
  final String r;
  final String s;

  PendingEthTxDto copyWith({
    String? blockHash,
    int? blockNumber,
    String? from,
    String? gas,
    String? maxPriorityFeePerGas,
    String? maxFeePerGas,
    String? hash,
    String? input,
    String? nonce,
    String? to,
    int? transactionIndex,
    String? value,
    String? type,
    List<dynamic>? accessList,
    String? chainId,
    String? v,
    String? r,
    String? s,
  }) =>
      PendingEthTxDto(
        blockHash: blockHash ?? this.blockHash,
        blockNumber: blockNumber ?? this.blockNumber,
        from: from ?? this.from,
        gas: gas ?? this.gas,
        maxPriorityFeePerGas: maxPriorityFeePerGas ?? this.maxPriorityFeePerGas,
        maxFeePerGas: maxFeePerGas ?? this.maxFeePerGas,
        hash: hash ?? this.hash,
        input: input ?? this.input,
        nonce: nonce ?? this.nonce,
        to: to ?? this.to,
        transactionIndex: transactionIndex ?? this.transactionIndex,
        value: value ?? this.value,
        type: type ?? this.type,
        accessList: accessList ?? this.accessList,
        chainId: chainId ?? this.chainId,
        v: v ?? this.v,
        r: r ?? this.r,
        s: s ?? this.s,
      );

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    map['blockHash'] = blockHash;
    map['blockNumber'] = blockNumber;
    map['from'] = from;
    map['gas'] = gas;
    map['maxPriorityFeePerGas'] = maxPriorityFeePerGas;
    map['maxFeePerGas'] = maxFeePerGas;
    map['hash'] = hash;
    map['input'] = input;
    map['nonce'] = nonce;
    map['to'] = to;
    map['transactionIndex'] = transactionIndex;
    map['value'] = value;
    map['type'] = type;
    map['accessList'] = accessList;
    map['chainId'] = chainId;
    map['v'] = v;
    map['r'] = r;
    map['s'] = s;
    return map;
  }

  @override
  String toString() {
    return toMap().toString();
  }
}
