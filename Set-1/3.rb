#!/usr/bin/env ruby

require_relative '2'
require 'strscan'

InputString = "1b37373331363f78151b7f2b783431333d78397828372d363c78373e783a393b3736"

# def freq s
#   x = {}
#   x.default = 0
#   s.each_char { |e| x[e] += 1 }
#   x
# end

HIGH_BIT_RANGE = /[\x80-\xff]/n

def validString?(str)
  sc = StringScanner.new(str)

  while sc.skip_until(HIGH_BIT_RANGE)
    sc.pos -= 1

    if !sequence_length(sc)
      return false
    end
  end

  true
end

def main
  # puts freq InputString
  hexStrings = (0..15).map {|e|
    (0..15).map { |f|
      ([(e.to_s(16) + f.to_s(16))].pack('H*') * (InputString.length / 2)).unpack('H*').last
    }
  }
  hexStrings.flatten!
  possibleSolutions = hexStrings.map { |str|
   [2.xor(str, InputString)].pack('H*')
  }
  possibleSolutions.each { |e|
    if validString? e
      puts e
    end
  }
end

main if __FILE__ == $0
