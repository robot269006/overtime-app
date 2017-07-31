RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.before(:each) do
    # before each time it runs, look up SMStool, and when that happens, it is swapped with FakeSms
    stub_const("SmsTool", FakeSms)
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
