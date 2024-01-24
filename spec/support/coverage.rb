# frozen_string_literal: true

require "simplecov"

return if ENV["COVERAGE"] == "false"

# if ENV["CI"]
#   require "coveralls"
#   SimpleCov.formatter = Coveralls::SimpleCov::Formatter
# end

SimpleCov.start(:rails) do
  add_group("Commands", "app/commands")
  enable_coverage :branch
end
SimpleCov.minimum_coverage(line: 100, branch: 100)