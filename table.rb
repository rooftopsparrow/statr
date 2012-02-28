class Table

  def initialize(*args)
    @table = {:data => args }
  end

  def [](index)
    @table[:data][index]
  end

  def to_s
    @table[:data]
  end

  def s(arg, sum=true)
    v = Vector[]
    if arg == 'xx'
      x = y = @table[:data][0]
    elsif arg == 'yy'
      x = y = @table[:data][1]
    elsif arg == 'xy'
      x, y = @table[:data]
    else
      raise "Options include: 'xx', 'yy', or 'xy'"
    end
    xbar, ybar = x.mean, y.mean
    for xi, yi in x.zip(y)
      v.push((xi-xbar)*(yi-ybar))
    end
    sum ? v.sum : v
  end

  def correlate
    self.s('xy') / Math.sqrt(self.s('xx')*self.s('yy'))
  end
end