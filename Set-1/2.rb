#!/usr/bin/env ruby

def treatAsHex s
  [s].pack('H*').unpack('B*').last.to_i 2
end

public
def xor(str1, str2)
  str1.scan(/\w\w/).zip(str2.scan(/\w\w/)).map { |s1_c, s2_c|
    h1 = treatAsHex s1_c
    h2 = treatAsHex s2_c
    (h1 ^ h2).to_s(16).rjust(2, '0')
  }.join
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
