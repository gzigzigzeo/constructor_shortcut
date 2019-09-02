require "dry/initializer"

# rubocop:disable Metrics/BlockLength
RSpec.describe ConstructorShortcut do
  let!(:klass) do
    Class.new do
      extend Dry::Initializer
      extend ConstructorShortcut[:call, :[]]

      param :foo

      def call
        foo
      end
    end
  end

  let!(:clean_klass) do
    Class.new do
      extend Dry::Initializer
      extend ConstructorShortcut

      param :foo

      def call
        foo
      end
    end
  end

  it "creates shortcut" do
    expect(klass[5]).to eq(5)
  end

  it "creates shortcut with no [] call" do
    expect(clean_klass.call(5)).to eq(5)
  end

  it "shows proper ancestors for singleton class", focus: true do
    expect(klass.singleton_class.ancestors).to include(
      ConstructorShortcut[:call, :[]]
    )
  end
end
