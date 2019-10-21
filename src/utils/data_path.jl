"""
        data_path(region::String="GER_1")
- Returning AbstractString where the example data is stored for regions:
- `"GER_1"`: Germany 1 node
- `"GER_18"`: Germany 18 nodes
- `"CA_1"`: California 1 node
- `"CA_14"`: California 14 nodes
- `"TX_1"`: Texas 1 node
"""
function data_path(region::String="GER_1")
    # Check for existance of the region in data
    region in readdir(normpath(joinpath(@__DIR__,"..","..","data"))) || throw(error("The region $region is not found. The provided regions are: GER_1: Germany 1 node, GER_18: Germany 18 nodes, CA_1: California 1 node, CA_14: California 14 nodes, TX_1: Texas 1 node"))
    # Generate the data path based on application and region
    data_path=normpath(joinpath(@__DIR__,"..","..","data",region,"TS"))
    return data_path
end
