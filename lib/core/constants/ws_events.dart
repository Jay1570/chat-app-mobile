class WsEvents {
  const WsEvents._();
  static String messageNew(String conversationId) =>
      'conversation:$conversationId:message:new';
  static String messageUpdated(String conversationId) =>
      'conversation:$conversationId:message:updated';
  static String messageDeleted(String conversationId) =>
      'conversation:$conversationId:message:deleted';
  static String conversationRead(String conversationId) =>
      'conversation:$conversationId:read';
  static String conversationNewRequest() => 'conversation:request:new';
  static String conversationRequestReviewed() =>
      'conversation:request:reviewed';
}
