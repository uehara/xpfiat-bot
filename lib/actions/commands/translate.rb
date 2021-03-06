# frozen_string_literal: true

require "discordrb"
require "mechanize"
require "json"
require "dotenv/load"

module Actions
  module Commands
    # 翻訳(IBM)
    module Translate
      extend Discordrb::Commands::CommandContainer

      command :jp2en do |event, *sentences|
        translated = blue_mix_translate(sentences.join(" "), "ja-en")
        event.send_message(translated)
      end

      command :en2jp do |event, *sentences|
        translated = blue_mix_translate(sentences.join(" "), "en-ja")
        event.send_message(translated)
      end

      module_function

      def blue_mix_translate(text, model_id)
        body = { "text": text, "model_id": model_id }.to_json
        agent = Mechanize.new
        uri = "https://gateway.watsonplatform.net/language-translator/api"
        agent.add_auth(uri, ENV["BLUE_MIX_USER"], ENV["BLUE_MIX_PASS"])
        agent.request_headers = {
          "Accept" => "application/json"
        }
        additional_headers = {
          "content-type" => "application/json"
        }
        # TODO: エラー対応
        uri_translate = "#{uri}/v2/translate"
        response = agent.post(uri_translate, body, additional_headers)
        JSON.parse(response.body)["translations"][0]["translation"]
      end
    end
  end
end
