class Steamroller
  def self.flatten(hash, joiner=".", &block)
    flat = self.combine_keys(hash, joiner, [], &block).flatten
    Hash[*flat.map {|f| f.to_a}.flatten]
  end
  
  private
    def self.combine_keys(data, joiner=".", prefix=[], &block)
      if data.respond_to?(:keys)
        data.keys.collect do |key|
          combine_keys(data[key], joiner, [prefix, key], &block)
        end.flatten
      else
        return nil if block_given? && !yield(data)
        [prefix.flatten.join(joiner) => data]
      end
    end
end
