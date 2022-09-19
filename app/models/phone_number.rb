class PhoneNumber
  attr_reader :value
  EXPECTED_NUMBER_OF_DIGITS = 10

  def initialize(value)
    @value = value.gsub(/\D/, "")
    .split("")
    .last(EXPECTED_NUMBER_OF_DIGITS)
    .join
  end
end
