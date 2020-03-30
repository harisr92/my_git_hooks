class CurrentBranch
  attr_reader :ref

  def initialize
    @ref = nil
  end

  def name
    ref = `command git symbolic-ref --quiet HEAD 2> /dev/null`.strip
    ret = $?.exitstatus
    unless ret.zero? || ret != 128
      ref = `command git rev-parse --short HEAD 2> /dev/null`.strip
    end
    ref.gsub(/^refs\/heads\//, '')
  end
end
