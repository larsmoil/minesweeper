require 'spec_helper'

class Minesweeper

  def board(specification)
    @cells = specification.split
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
    result.join(" ")
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
    context "no mines" do
      it "returns all blank cells" do
        subject.board("_ _ _").should == "_ _ _"
      end
    end
    context "one mine" do
      it "shows 1 next to the mine" do
        subject.board("x _ _").should == "x 1 _"
      end
      it "shows 1 x 1" do
        subject.board("_ x _").should == "1 x 1"
      end
      it "shows _ 1 x 1" do
        subject.board("_ _ x _").should == "_ 1 x 1"
      end
    end
    context "two mines" do
      it "shows x 2 x" do
        subject.board("x _ x").should == "x 2 x"
      end
      it "shows x x 1" do
        subject.board("x x _").should == "x x 1"
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
