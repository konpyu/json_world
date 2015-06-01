RSpec.describe JsonWorld::PropertyDefinable do
  let(:klass) do
    Class.new do
      include JsonWorld::PropertyDefinable

      property(
        :id,
        example: 42,
        type: Integer,
      )

      property(
        :name,
        example: "r7kamura",
        type: String,
      )

      attr_reader :id, :name

      def initialize(id:, name:)
        @id = id
        @name = name
      end
    end
  end

  describe ".as_json_schema" do
    subject do
      klass.as_json_schema
    end
  end

  describe ".property" do
    it "appends JsonWorld::PropertyDefinition" do
      expect(klass.property_definitions[0].property_name).to eq :id
      expect(klass.property_definitions[1].property_name).to eq :name
    end
  end
end