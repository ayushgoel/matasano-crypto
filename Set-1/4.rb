#!/usr/bin/env ruby

require_relative '3'

def main
  File.open("4.txt") { |f|
    f.each_line { |line|
        decrypt(line.chomp).each { |e|
            puts e
        }
    }
  }
end

main if __FILE__ == $0
