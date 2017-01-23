# Some problems appear hard though they are very easy. Today Aakash is stuck in a range query problem. He has been given an array with only numbers 0 and 1. There are two types of queries -

# 0 L R : Check whether the number formed from the array elements L to R is even or odd and print EVEN or ODD respectively. Number formation is the binary number from the bits status in the array L to R

# 1 X : Flip the Xth bit in the array

# Input
# First line contains a number N and Q as input. Next line contains N space separated 0 or 1. Next Q lines contain description of each query

# Output
# Output for only query type 0 L R whether the number in range L to R is "EVEN" or "ODD" (without quotes).

# Constraints
# 1≤ N ≤ 10^6
# 1≤ L ≤ R ≤ 10^6
# 1≤ Q ≤ 10^6

# 1≤ X ≤ N


# Input

# 5 2
# 1 0 1 1 0
# 1 2
# 0 1 4

# Output

# ODD

def print_odd_or_even(number)
    (number % 2).eql?(0) ? 'EVEN' : 'ODD'
end

def convert_binary_to_integer(input)
    subtractor=0
    output = 0
    length = input.length
    length.times do
        output += input[length-1-subtractor]*(2**subtractor)
        subtractor += 1
    end
    output
end

def process_flip_query(number,query)
    query.split(' ').collect{|x| x.to_i}.each do |bit|
        number[bit] = number[bit]^1
    end
    number
end

n,q = gets.chomp.split(' ').collect{|x| x.to_i}
number = gets.chomp.split(' ').collect{|x| x.to_i}

q.times do
    number = process_flip_query(number,gets.chomp)
end

print print_odd_or_even(convert_binary_to_integer(number))