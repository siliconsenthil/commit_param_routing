require "ostruct"
require_relative '../test_helper'

describe CommitParamRouting do
  it "must be defined" do
    CommitParamRouting::VERSION.wont_be_nil
  end

  describe "matches?" do
    it "should return true when param matches" do
      CommitParamRouting.new(:save).matches?(stub_request("save")).must_equal true
      CommitParamRouting.new(:save).matches?(stub_request("something_else")).must_equal false
      CommitParamRouting.new("save").matches?(stub_request("SaVe")).must_equal false
    end

    it "should return true when one of the param matches" do
      CommitParamRouting.new(:save, :revise).matches?(stub_request("revise")).must_equal true
      CommitParamRouting.new(:save, :revise).matches?(stub_request("no_revise")).must_equal false
    end
  end

  private
  def stub_request(commit_param)
    OpenStruct.new(params: {commit: commit_param}.with_indifferent_access)
  end
end
