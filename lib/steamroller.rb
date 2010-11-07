class Hash
  def flatten(joiner=".", &block)
    flat = combine_keys(self, joiner, [], &block).flatten
    Hash[*flat.map {|f| f.to_a}.flatten]
  end
  
private
  def combine_keys(data, joiner=".", prefix=[], &block)
    if data.respond_to?(:keys)
      data.keys.collect do |key|
        combine_keys(data[key], joiner, [prefix, key], &block)
      end.flatten
    else
      return nil if block_given? && !yield(data)
      begin
        require 'ruby-debug'
      rescue LoadError
        if RUBY_VERSION.to_f == 1.9
          rdebug_version = "ruby-debug19"
        else
          rdebug_version = "ruby-debug"
        end
        puts "Missing ruby-debug. Install with: gem install #{rdebug_version}"
      end
      [prefix.flatten.join(joiner) => data]
    end
  end
end
