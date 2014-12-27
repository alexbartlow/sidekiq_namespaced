# SidekiqNamespaced

Allows simple overrides of your regularly scheduled sidekiq namespace, for
example, when you have multiple sidekiq clusters and you want to pull stats for
all of them, or use the native sidekiq methods to enqueue jobs to a different
cluster.

Requires sidekiq 3.0

## Usage

````
SidekiqNamespaced.decorate(Sidekiq)

Sidekiq.with_namespace("cluster-two") do
  @stats = Sidekiq::Stats.new
  # do some stuff with "cluster-two's" stats
end
````

## Contributing

1. Fork it ( https://github.com/alexbartlow/sidekiq_namespaced/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
