#!/usr/bin/env ruby

require_relative '2'

public
def decrypt s
  hexStrings = (0..255).map { |e|
    ([e.to_s(16)].pack('H*') * (s.length / 2)).unpack('H*').last
  }

  possibleSolutions = hexStrings.map { |str|
   [2.xor(str, s)].pack('H*')
  }

  matchedSolution = possibleSolutions.map { |e|
    begin
      str = e.encode('utf-8')
      if str =~ /^([[:alnum:]]|[[:blank:]]|[[:punct:]])*$/
        str
      end
    rescue Exception => e
    end
  }
  matchedSolution.compact
end

InputString = "1b37373331363f78151b7f2b783431333d78397828372d363c78373e783a393b3736"

def main
  decrypt(InputString).each { |e| puts e }
end

main if __FILE__ == $0
