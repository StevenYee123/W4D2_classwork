class Employee

  attr_reader :name, :title, :boss

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary  
    @boss = boss
  end

  def bonus(mult)
    salary * mult
  end


  protected

  attr_reader :salary


end