module NumberHelper
  def self.to_number(str)
    begin
      Integer(str || '')
    rescue ArgumentError
      -1
    end
  end
end
