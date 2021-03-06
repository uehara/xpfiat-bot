# frozen_string_literal: true

require "discordrb"

module Actions
  module Commands
    # XP/Jpy のレートを返すコマンド
    module XpJpy
      extend Discordrb::Commands::CommandContainer

      command [:xp_jpy, :いくら] do |event, _param|
        xp2jpy(event, _param)
      end
    end
  end
end
