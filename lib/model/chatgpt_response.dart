import 'dart:convert';

import 'package:flutter/foundation.dart';

class ChatGptResponse {
  final String id;
  final String object;
  final int created;
  final String model;
  final List<Choice> choices;
  final Usage usage;
  ChatGptResponse({
    required this.id,
    required this.object,
    required this.created,
    required this.model,
    required this.choices,
    required this.usage,
  });

  ChatGptResponse copyWith({
    String? id,
    String? object,
    int? created,
    String? model,
    List<Choice>? choices,
    Usage? usage,
  }) {
    return ChatGptResponse(
      id: id ?? this.id,
      object: object ?? this.object,
      created: created ?? this.created,
      model: model ?? this.model,
      choices: choices ?? this.choices,
      usage: usage ?? this.usage,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'object': object,
      'created': created,
      'model': model,
      'choices': choices.map((x) => x.toMap()).toList(),
      'usage': usage.toMap(),
    };
  }

  factory ChatGptResponse.fromMap(Map<String, dynamic> map) {
    return ChatGptResponse(
      id: map['id'] ?? '',
      object: map['object'] ?? '',
      created: map['created']?.toInt() ?? 0,
      model: map['model'] ?? '',
      choices: List<Choice>.from(map['choices']?.map((x) => Choice.fromMap(x))),
      usage: Usage.fromMap(map['usage']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatGptResponse.fromJson(String source) => ChatGptResponse.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ChatGptResponse(id: $id, object: $object, created: $created, model: $model, choices: $choices, usage: $usage)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ChatGptResponse &&
      other.id == id &&
      other.object == object &&
      other.created == created &&
      other.model == model &&
      listEquals(other.choices, choices) &&
      other.usage == usage;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      object.hashCode ^
      created.hashCode ^
      model.hashCode ^
      choices.hashCode ^
      usage.hashCode;
  }
}

class Choice {
  final String text;
  final int index;
  final Logprobs logprobs;
  final String finish_reason;
  Choice({
    required this.text,
    required this.index,
    required this.logprobs,
    required this.finish_reason,
  });

  Choice copyWith({
    String? text,
    int? index,
    Logprobs? logprobs,
    String? finish_reason,
  }) {
    return Choice(
      text: text ?? this.text,
      index: index ?? this.index,
      logprobs: logprobs ?? this.logprobs,
      finish_reason: finish_reason ?? this.finish_reason,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'index': index,
      'logprobs': logprobs,
      'finish_reason': finish_reason,
    };
  }

  factory Choice.fromMap(Map<String, dynamic> map) {
    return Choice(
      text: map['text'] ?? '',
      index: map['index']?.toInt() ?? 0,
      logprobs:  Logprobs(),
      finish_reason: map['finish_reason'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Choice.fromJson(String source) => Choice.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Choice(text: $text, index: $index, logprobs: $logprobs, finish_reason: $finish_reason)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Choice &&
      other.text == text &&
      other.index == index &&
      other.logprobs == logprobs &&
      other.finish_reason == finish_reason;
  }

  @override
  int get hashCode {
    return text.hashCode ^
      index.hashCode ^
      logprobs.hashCode ^
      finish_reason.hashCode;
  }
}

class Logprobs {
}

class Usage {
  final int prompt_tokens;
  final int completion_tokens;
  final int total_tokens;
  Usage({
    required this.prompt_tokens,
    required this.completion_tokens,
    required this.total_tokens,
  });

  Usage copyWith({
    int? prompt_tokens,
    int? completion_tokens,
    int? total_tokens,
  }) {
    return Usage(
      prompt_tokens: prompt_tokens ?? this.prompt_tokens,
      completion_tokens: completion_tokens ?? this.completion_tokens,
      total_tokens: total_tokens ?? this.total_tokens,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'prompt_tokens': prompt_tokens,
      'completion_tokens': completion_tokens,
      'total_tokens': total_tokens,
    };
  }

  factory Usage.fromMap(Map<String, dynamic> map) {
    return Usage(
      prompt_tokens: map['prompt_tokens']?.toInt() ?? 0,
      completion_tokens: map['completion_tokens']?.toInt() ?? 0,
      total_tokens: map['total_tokens']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Usage.fromJson(String source) => Usage.fromMap(json.decode(source));

  @override
  String toString() => 'Usage(prompt_tokens: $prompt_tokens, completion_tokens: $completion_tokens, total_tokens: $total_tokens)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Usage &&
      other.prompt_tokens == prompt_tokens &&
      other.completion_tokens == completion_tokens &&
      other.total_tokens == total_tokens;
  }

  @override
  int get hashCode => prompt_tokens.hashCode ^ completion_tokens.hashCode ^ total_tokens.hashCode;
}