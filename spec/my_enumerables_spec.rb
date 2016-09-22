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
end