
module ActiveModelSerializers
  module Adapter
    class Restful < Base
      def serializable_hash(options = nil)
        (serializer.object.class.include?(Enumerable) ? Json : Attributes)
          .new(serializer, instance_options).serializable_hash(serialization_options(options))
      end
    end
  end
end
