require File.expand_path("../../lib/sidekiq_namespaced", __FILE__)

describe SidekiqNamespaced do
  SidekiqNamespaced.decorate(Sidekiq)
  it "should allow setting namespace" do
    Sidekiq.with_namespace("test-namespace") do
      Sidekiq.redis do |conn|
        expect(conn.namespace).to eq "test-namespace"
      end
    end
  end
  
  it "should not decorate the namespace outside of the with_namespace block" do
    Sidekiq.redis do |conn|
      expect(conn).not_to respond_to(:namespace)
    end
  end
end
