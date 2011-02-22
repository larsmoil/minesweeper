require 'spec_helper'

class Minesweeper

  def board(specification)
    res = []
    specification.each do |row|
      @cells = row.split
      result = []

      @cells.each_with_index do |c, i|
        if mine?(i)
          result << "x"
        elsif next_cell_is_mine?(i) && previous_cell_is_mine?(i)
          result << "2"
        elsif next_cell_is_mine?(i) || previous_cell_is_mine?(i)
          result << "1"
        else
          result << c
        end
      end
      res << result.join(" ")
    end
    res
  end

  def mine?(i)
    @cells[i] == "x"
  end
  def previous_cell_is_mine?(i)
    mine?(i-1) if i > 0
  end

  def next_cell_is_mine?(i)
    mine?(i+1)
  end
end

describe Minesweeper do
  context "Contains 1 row with" do
    it "works in 1 dimension" do
      {
        ["_ _ _"] => ["_ _ _"],
        ["x _ _"] => ["x 1 _"],
        ["x _ x"] => ["x 2 x"],
        ["x x _"] => ["x x 1"],
        ["_ _ x _"] => ["_ 1 x 1"],
        }.map do |k,v|
          subject.board(k).should == v
        end
      end
    end
    context "Contains 2 row with" do
      context "no mines" do
        it "returns all blank cells" do
          subject.board(["_ _ _", "_ _ _"]).should == ["_ _ _", "_ _ _"]
        end
      end
    end
  end
