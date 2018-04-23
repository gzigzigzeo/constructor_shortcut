RSpec.describe TestConstructorShortcut do
  it do
    expect(described_class.call(5)).to eq(5)
  end
end
