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
    data_path=normpath(joinpath(@__DIR__,"..","..","data",region))
    return data_path
end

"""
        load_timeseries_data_provided(region::String="GER_1"; T::Int=24, years::Array{Int,1}=[2016], att::Array{String,1}=Array{String,1}())
- Adding the information in the `*.csv` file at `data_path` to the data dictionary
The `*.csv` files shall have the following structure and must have the same length:

|`Timestamp`  |`Year`  |[column names...] |
|-------------|--------|------------------|
|[iterator]   |[year]  |[values]          |

The first column should be called `Timestamp` if it contains a time iterator
The other columns can specify the single timeseries like specific geolocation.
for regions:
- `"GER_1"`: Germany 1 node
- `"GER_18"`: Germany 18 nodes
- `"CA_1"`: California 1 node
- `"CA_14"`: California 14 nodes
- `"TX_1"`: Texas 1 node
"""
function load_timeseries_data_provided(region::String="GER_1";
                              T::Int=24,
                              years::Array{Int,1}=[2016],
                              att::Array{String,1}=Array{String,1}())
    # Generate the data path based on application and region
    path=joinpath(data_path(region),"TS")
    return load_timeseries_data(path; region=region, T=T, years=years, att=att)
end

"""
    load_cep_data_provided(region::String)
Loading from .csv files in a the folder `../data/{region}/`
Follow instructions preparing your own data:
-`region::String`: name of state or region data belongs to
-`costs::OptVariable`: `costs[tech,node,year,account,impact] - annulized costs [USD in USD/MW_el, CO2 in kg-CO₂-eq./MW_el]`
-`techs::OptVariable`: `techs[tech] - OptDataCEPTech`
-`nodes::OptVariable`: `nodes[tech,node] - OptDataCEPNode`
-`lines::OptVarible`: `lines[tech,line] - OptDataCEPLine`
for regions:
- `"GER_1"`: Germany 1 node
- `"GER_18"`: Germany 18 nodes
- `"CA_1"`: California 1 node
- `"CA_14"`: California 14 nodes
- `"TX_1"`: Texas 1 node
"""
function load_cep_data_provided(region::String)
  path=data_path(region)
  return load_cep_data(path;region=region)
end
