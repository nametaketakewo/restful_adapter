require './test_helper'

module ActiveModelSerializers
  module Adapter
    class ResfulTest < ActiveSupport::TestCase

      class Article < ActiveModelSerializers::Model
        attributes :title, :body
      end

      class ArticleSerializer < ActiveModel::Serializer
        attributes :title, :body
      end

      def setup
        ActionController::Base.cache_store&.clear
      end

      def test_one_resource
        article = Article.new(title: 'Title', body: 'Body')
        serializer = ArticleSerializer.new(article)
        restful_adapter = ActiveModelSerializers::Adapter::Restful.new(serializer)
        attributes_adapter = ActiveModelSerializers::Adapter::Attributes.new(serializer)
        json_adapter = ActiveModelSerializers::Adapter::Json.new(serializer)

        assert_equal(restful_adapter.serializable_hash, attributes_adapter.serializable_hash)
        assert_not_equal(restful_adapter.serializable_hash, json_adapter.serializable_hash)
      end

      def test_multiple_resources
        articles = (1..3).to_a.map do |i|
          Article.new(title: "Title#{i}", body: "Body#{i}")
        end
        serializer = ActiveModel::Serializer::CollectionSerializer.new(articles)
        restful_adapter = ActiveModelSerializers::Adapter::Restful.new(serializer)
        attributes_adapter = ActiveModelSerializers::Adapter::Attributes.new(serializer)
        json_adapter = ActiveModelSerializers::Adapter::Json.new(serializer)

        assert_equal(restful_adapter.serializable_hash,json_adapter.serializable_hash)
        assert_not_equal(restful_adapter.serializable_hash,attributes_adapter.serializable_hash)
      end
    end
  end
end
