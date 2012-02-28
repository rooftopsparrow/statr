require './table'

class Vector

  include Enumerable
  
  def initialize(*args)
    @vector = [*args]
  end
  
  def each(&block)
    @vector.each(&block)
  end
  
  def size
    @vector.size
  end
  
  def empty?
    @vector.empty?
  end
  
  def [](index)
    @vector[index]
  end
  
  def sum
    sum = 0.0
    self.each do |x|
      sum += x
    end
    sum
  end
  
  def mean
    s = self.sum / self.size
  end

  def trim(perc)
    raise "trim mean only accepts a range of 0 to 0.2" if not (0..0.2).include? perc
    num = (perc * self.size).round
    self.slice(num, self.size - (num * 2)).mean
  end

  def geo
    prod = 1.0
    self.each do |f|
      prod *= f
    end
    prod**(1.0/self.size)
  end

  def median
    a = self.sort
    len = self.size
    if len % 2 == 0
      (a[len/2] + a[(len/2) - 1]) / 2.0
    else
      a[len/2]
    end
  end

  def range
    n = self.sort
    n[n.size] - n[0]
  end

  def iqr
    arr = self.sort
    d = {}
    d[:min] = arr.first
    q1 = (arr.median * 0.25).round
    d[:q1] = arr[q1]
    q3 = (arr.median * 0.75).round
    d[:q3] = arr[q3]
    d[:max] = arr.last
    d[:irq] = d[:q3] - d[:q1]
    d[:ll] = d[:q1] - 1.5 * d[:irq]
    d[:ul] = d[:q3] + 1.5 * d[:irq]
    d
  end

  def deviation
    xbar = self.mean
    total = 0
    self.each do |xi|
      total += (xi - xbar)**2
    end
    Math.sqrt(total/(self.size - 1))
  end

  def standardize
    xbar = self.mean
    s = self.deviation
    n = self.collect do |z|
      (z-mean)/s
    end
    Vector.new(n)
  end

  def freq
    n = Vector.new
    self.uniq.each do |i|
      n.push(self.count(i))
    end
    Table.new(self.uniq, n)
  end
  
  def to_s
    @vector
  end
  
end              