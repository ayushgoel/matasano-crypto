#!/usr/bin/env ruby

require_relative '2'

def decrypt(input, key)
    inputInHex = input.unpack('H*').last
    keyInHex = key.unpack('H*').last
    fullKey = (keyInHex * ((inputInHex.length / keyInHex.length) + 1))[0, inputInHex.length]
    2.xor(inputInHex, fullKey)
end


def main
    input = "Burning 'em, if you ain't quick and nimble\nI go crazy when I hear a cymbal"
    key = "ICE"
    puts decrypt(input, key)
end

main if __FILE__ == $0
