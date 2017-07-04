module IssueService
  class IdGenerator
    ALFABET = ('A'..'Z').to_a

    def generate
      result = []
      result << rand_alfa
      result << rand_num
      result << rand_alfa
      result << rand_num
      result << rand_alfa
      result.join('-')
    end

    private
    def rand_alfa
      3.times.map { ALFABET.sample }.join('')
    end

    def rand_num
      '%03d' % rand(1000)
    end
  end
end