#!/usr/bin/env ruby

require 'optparse'

def base64Index
  return ("A".."Z").to_a + ("a".."z").to_a + ("0".."9").to_a + ["+", "/"]
end

# h is a string of hexadecimal numbers
def base64Hex h
  h = [h].pack('H*')
  bits = h.unpack('B*').last
  paddingAdded = 0
  if bits.length % 6 != 0
    paddingAdded = 6 - (bits.length % 6)
    finalLength = bits.length + paddingAdded
    bits = bits.ljust(finalLength, "0")
  end
  bitSlices = (0...bits.length).step(6).to_a.map { |e| bits.slice(e, 6) }
  indexes = bitSlices.map { |slice| slice.to_i 2 }
  str = indexes.map { |index| base64Index[index] }
  str.join + "=" * (paddingAdded / 2)
end

# str is a normal ASCII string
def base64String s
  return base64Hex(s.unpack('H*').last)
end

def base64(isHex, string)
  if isHex
    return base64Hex string
  end
  return base64String string
end

def main
  inputIsHex = false
  parser = OptionParser.new do |opts|
    opts.on("--hex", "The input string is treated as hexadecimal if this flag present.") { inputIsHex = true}
  end
  parser.parse!
  inputString = ARGV.join ""

  $stdout.puts base64(inputIsHex, inputString)
end

main if __FILE__ == $0
