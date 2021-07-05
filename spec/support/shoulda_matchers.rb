# frozen_string_literal: true

Shoulda::Matchers.configure do |configure|
  configure.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
