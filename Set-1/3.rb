#!/usr/bin/env ruby

require_relative '2'

InputString = "1b37373331363f78151b7f2b783431333d78397828372d363c78373e783a393b3736"

def main
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
    begin
      str = e.encode('utf-8')
      if str =~ /^([[:alnum:]]|[[:blank:]]|[[:punct:]])*$/
        puts str
      end
    rescue Exception => e
    end
  }
end

main if __FILE__ == $0
