require_relative '../lib/graph.rb'

describe Graph do
  before do 
    @graph = Graph.new([ [:a, :b, 3],
                [:a, :c, 2],
                [:b, :e, 1],
                [:b, :c, 5],
                [:b, :d, 7],
                [:c, :d, 6],
                [:d, :e, 8],
                [:d, :f, 5],
                [:e, :f, 12],
				[:c, :e, 1]
              ])
  end
  
  it "Need to verify no. of vertices" do
    (@graph.vertices.length).should == 6 
  end
  
  it "Need to verify no. of edges" do
    (@graph.edges.length/2).should == 10 
  end
  
  it "Need to verify the neighbours" do
    (@graph.vertices[:a].neighbours.join(',')).should == "b,c"
  end
  
  it "Need to get the shortest path with provided source and distination" do
    start, stop = :a, :f
	(@graph.shortest_path(start, stop)[0].join('->')).should == "a->c->d->f"
  end
  
  it "Need to get the shortest path distance with provided source and distination" do
    start, stop = :a, :f
    (@graph.shortest_path(start, stop)[1]).should == 13
  end
  
end