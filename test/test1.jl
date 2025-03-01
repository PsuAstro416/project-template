using Test
using Dashboard

@testset "Checking functions from ingest.jl" begin
    d100 = get_data(100)
    @test size(d100) == (100,3)
    @test validate_data(d100)

    d1 = get_data(1)
    @test size(d1) == (1,3)
    @test !validate_data(d1)
end;

@testset "Checking internal functions for quadratic model from fit.jl" begin
    d200 = get_data(200)
    A200 = Dashboard.calc_design_matrix(d200.x, 2)
    coef_200 = Dashboard.fit_no_reg(A200, d200.y)
    @test 0.9 < coef_200[1] < 1.1
    @test 0.9 < coef_200[2] < 1.2
    @test 0.0 < coef_200[3] < 0.2

    pred_200 = Dashboard.predict_general_linear_model(A200, coef_200)
    @test 200-3*sqrt(200) < sum(abs2.((d200.y.-pred_200)./d200.σy)) < 200+3*sqrt(200)
end;

