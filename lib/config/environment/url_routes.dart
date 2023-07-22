abstract final class UrlRoutes {
  static get _baseElevenLabsUrl => 'https://api.elevenlabs.io/v1';
  static get textToSpeech => '$_baseElevenLabsUrl/text-to-speech/{voiceId}';

  static get gptCompletions => 'https://api.openai.com/v1/chat/completions';

  static get getArticles => 'https://www.newsapi.ai/api/v1/article/getArticles';
}
