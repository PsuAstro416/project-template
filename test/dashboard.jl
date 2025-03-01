using Test
using Pluto
import Pkg

@testset "Testing outputs of dashboard" begin
   Pluto.activate_notebook_environment("../dashboard.jl")
   # Pkg.instantiate()  # Probably not necessary and will slow you down.  But uncomment if getting errors

@testset "Running dashboard.jl" begin
   include("../dashboard.jl")
end;

@testset "Checking that bool's are true" begin
   @test data_passes
   @test try_fit_simple
   @test try_fit_complex
end;

@testset "Checking results for linear model" begin
   @test 0.9 < coef_linear[1] < 1.1
   @test 0.9 < coef_linear[2] < 1.2
end;

@testset "Checking results for quadratic model" begin
   @test 0.9 < coef_quad[1] < 1.1
   @test 0.9 < coef_quad[2] < 1.1
   @test 0.001 < coef_quad[3] < 0.2
end;

end; # Testing dashboard results

