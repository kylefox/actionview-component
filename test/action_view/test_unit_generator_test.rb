# frozen_string_literal: true

require "test_helper"
require_relative File.expand_path("../../../lib/rails/generators/test_unit/component_generator", __FILE__)

class ActionView::TestUnitGeneratorTest < ::Rails::Generators::TestCase
  tests TestUnit::Generators::ComponentGenerator
  destination File.expand_path("../tmp", File.dirname(__FILE__))

  setup do
    run_generator %w(Dummy data)
  end

  teardown do
    File.delete File.expand_path("../../tmp/test/components/dummy_component_test.rb", __FILE__)
  end

  test "generates component" do
    assert_file "../tmp/test/components/dummy_component_test.rb" do |content|
      assert_match(/render_inline\(DummyComponent, attr: "value"\) { "Hello, components!" }.css\("span"\).to_html/, content)
    end
  end
end
