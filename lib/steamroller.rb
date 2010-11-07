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
      require 'ruby-debug'
      debugger
      [prefix.flatten.join(joiner) => data]
    end
  end
end
