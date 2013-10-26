class CommitParamRouting
  VERSION = "0.0.1"

  def initialize(*param_values)
    @param_values = param_values
  end

  def matches?(request)
    @param_values.any?{|prm| request.params[:commit] == prm.to_s}
  end
end
