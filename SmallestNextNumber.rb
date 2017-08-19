class SmallestNext

  def initialize(test)
    print 'Input: '
    puts   test
    @num = test.to_s.chars.map(&:to_i)
  end

  def find_next_one()
    n = @num.length
    found = 0

    #  1 - check if all digits are all in the descending order
    index = @num.length - 1
    while found == 0 && index > 0
      if @num[index] >  @num[index-1]
        found = index
        break;
      end
      index-=1
    end

    if (found == 0)
      puts "Next: " + @num.join('')
      return @num.join('').to_i
    end
    x = @num[found - 1]
    minnum = found;

    # 2 - find the smallest digit that is greater
    # than number[found-1]
    j = found + 1
    while j < n do
      if (@num[j] > x && @num[j] < @num[minnum])
        minnum = j
      end
      j+=1
    end
    # 3 - Swap smallest digit found with next
    temp = @num[found-1]
    @num[found-1] = @num[minnum]
    @num[minnum] = temp

    # 4 - Sort remaining digits in ascending order
    @num[found, n]= @num[found, n].sort!
    puts "Next: " + @num.join('')
    return @num.join('').to_i
  end
end

require 'test/unit'
class SmallestNextTest < Test::Unit::TestCase
  def testSmallest
    f = SmallestNext.new(123987654)
    assert_equal f.find_next_one, 124356789
    f1 = SmallestNext.new(654)
    assert_equal f1.find_next_one, 654
  end
end
