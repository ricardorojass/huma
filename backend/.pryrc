# frozen_string_literal: true

if defined?(PryRails::RAILS_PROMPT)
  require "awesome_print"
  Pry.config.prompt = PryRails::RAILS_PROMPT
  AwesomePrint.pry!
end