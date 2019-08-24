require "dry/initializer"

RSpec.describe ConstructorShortcut do
  let(:klass) do
    Class.new do
      extend Dry::Initializer
      extend ConstructorShortcut[:call, :[]]

      param :foo

      def call
        foo
      end
    end
  end

  it "creates shortcut" do
    expect(klass[5]).to eq(5)
  end

  it "shows proper ancestors for singleton class" do
    expect(klass.singleton_class.ancestors).to include(
      ConstructorShortcut[:call, :[]]
    )
  end
end
