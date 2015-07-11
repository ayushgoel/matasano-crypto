#!/usr/bin/env ruby

def treatAsHex s
  [s].pack('H*').unpack('B*').last.to_i 2
end

def xor(str1, str2)
  h1 = treatAsHex str1
  h2 = treatAsHex str2
  (h1 ^ h2).to_s(16)
end

def help
  "Usage: ruby #{__FILE__} <string1> <string1>"
end

def main
  str1 = ARGV[0]
  str2 = ARGV[1]
  unless str1 and str2
    $stderr.puts help
  else
    $stdout.puts xor(str1, str2)
  end
end

main if __FILE__ == $0
