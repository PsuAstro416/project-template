using Test

module ModuleTestFunctions
using Test
@testset "Applying Tests in test1.jl" begin
   include("test1.jl")
end;
end;

module ModuleDashboard
using Test
@testset "Testing Dashboard" begin
   include("dashboard.jl")
end;
end;

