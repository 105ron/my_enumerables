require 'spec_helper'

describe ::Enumerable do 

	let(:ary) { [1,2,3,4] }

	describe "::my_each" do
		context "with non-enumerable object" do
    	it { expect { nil.my_each }.to raise_error NoMethodError }
    	it { expect { 14.my_each }.to raise_error NoMethodError }
    	it { expect { "Hello World!".my_each }.to raise_error NoMethodError }
		end
		context "with array and no block it returns array" do
			it { expect(ary.my_each).to eq "#<Enumerator: [1, 2, 3, 4]:my_each>" }
		end
	end
	describe "::my_select" do
		context "with non-enumerable object" do
			it { expect { nil.my_select }.to raise_error NoMethodError }
    	it { expect { 14.my_select }.to raise_error NoMethodError }
    	it { expect { "Hello World!".my_select }.to raise_error NoMethodError }
    end
    context "with array and no block it returns array" do
			it { expect(ary.my_select).to eq "#<Enumerator: [1, 2, 3, 4]:my_select>" }
		end
		context "with array and no block it returns array" do
			it { expect(ary.my_select {|x| x % 2 ==0}).to eq [2, 4] }
		end
	end
	describe "::my_all?" do
		context "with non-enumerable object" do
			it { expect { nil.my_all? }.to raise_error NoMethodError }
    	it { expect { 14.my_all? }.to raise_error NoMethodError }
    	it { expect { "Hello World!".my_all? }.to raise_error NoMethodError }
    end
	  context "with array and no block it returns true" do
			it { expect(ary.my_all?).to eq true }
		end
		context "with  empty array and no block it returns true" do
			it { expect([].my_all?).to eq true }
		end
		context "with  array and block without all matching it returns false" do
			it { expect(ary.my_all?{|x| x % 2 == 0}).to eq false }
		end
		context "with  array and block with all truism elements it returns true" do
			it { expect([2,4,6,8,10].my_all?{|x| x % 2 == 0}).to eq true }
		end
	end
	describe "::my_any?" do
		context "with non-enumerable object" do
			it { expect { nil.my_any? }.to raise_error NoMethodError }
    	it { expect { 14.my_any? }.to raise_error NoMethodError }
    	it { expect { "Hello World!".my_any? }.to raise_error NoMethodError }
    end
    context "with  empty array and no block it returns false" do
			it { expect([].my_any?).to eq false }
		end
		context "with array and no block it returns true" do
			it { expect([1,2,3,4,5].my_any?).to eq true }
		end
		context "with  array and block with one truism  at last element it returns true" do
			it { expect([2,4,6,8,10].my_any?{|x| x == 10}).to eq true }
		end
    context "with  array and block with no truism elements it returns false" do
			it { expect([2,4,6,8,10].my_any?{|x| x % 7 == 0}).to eq false }
		end
	end
	describe "::my_none?" do
		context "with non-enumerable object" do
			it { expect { nil.my_none? }.to raise_error NoMethodError }
    	it { expect { 14.my_none? }.to raise_error NoMethodError }
    	it { expect { "Hello World!".my_none? }.to raise_error NoMethodError }
    end
    context "with  empty array and no block it returns false" do
			it { expect([].my_none?).to eq true }
		end
		context "with array and no block it returns true" do
			it { expect(ary.my_none?).to eq false }
		end
		context "with  array and block with one truism  at last element it returns false" do
			it { expect([2,4,6,8,10].my_none?{|x| x == 10}).to eq false }
		end
    context "with  array and block with no truism elements it returns true" do
			it { expect([2,4,6,8,10].my_none?{|x| x % 7 == 0}).to eq true }
		end
	end
	describe "::inject" do
		context "with non-enumerable object" do
			it { expect { nil.my_inject }.to raise_error NoMethodError }
    	it { expect { 14.my_inject }.to raise_error NoMethodError }
    	it { expect { "Hello World!".my_inject }.to raise_error NoMethodError }
    end
    context "with  empty array and no block it returns nil" do
			it { expect([].my_inject).to eq nil }
		end
		context  "with array and no block it returns error" do
  		it "should raise" do
    		expect{ary.my_inject}.to raise_error(LocalJumpError)
  		end
		end
		context "with  array and block with executes block code" do
			it { expect(ary.my_inject(0){|x, sum| sum = sum + x}).to eq 10 }
		end
    context "with  array and block and injected integer it includes the integer in the sum" do
			it { expect(ary.my_inject(3){|x, sum| sum = sum + x}).to eq 13 }
		end
	end
end