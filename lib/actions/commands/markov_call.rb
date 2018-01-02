# frozen_string_literal: true

require "discordrb"
require "mechanize"
require "json"
require "dotenv/load"

module Actions
  module Commands
    # マルコフ連鎖用
    module MarkovCall
      extend Discordrb::Commands::CommandContainer

      command :markov_call do |event, *sentences|
        p sentences
        event.send_message(join_sentence(sentences))
      end

      module_function

      def join_sentence(sentences)
        sentence = ""
        sentences.each do |word|
          sentence += "#{word} "
        end
        sentence
      end

      def markov_call(text)

      end

    end
  end
end
