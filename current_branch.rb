require 'pry'
class CurrentBranch
  attr_reader :ref

  def initialize
    @ref = nil
  end

  def name
    ref = `command git symbolic-ref --quiet HEAD 2> /dev/null`
    ret = `$?`.to_i
    if ret.zero? || ret == 128
      ref = `command git rev-parse --short HEAD 2> /dev/null`
    end
    binding.pry
    `#{ref}#refs/heads/`
  end
end
