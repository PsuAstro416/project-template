# Functions for linear least squares fitting 
function fit_no_reg(A::AbstractArray{T,2}, y::AbstractVector) where {T<:Number}
        @assert size(A,1) == length(y)
        ATA = A' * A
        ATy = A' * y
        ATA \ ATy 
end 

function predict_general_linear_model(design_matrix::AbstractMatrix, θ::AbstractVector)
	@assert length(θ) == size(design_matrix,2)
	return design_matrix * θ
end

function calc_design_matrix( x::AbstractVector, order::Integer = 1)
        @assert order == 1 || order == 2
        n = length(x)
        if order == 1
            A = hcat(ones(n), x )
        else
            A = hcat(ones(n), x, x.^2 )
        end        
        return A
end

# Functions for simple model
function fit_linear_model(df::AbstractDataFrame)
	design_matrix = calc_design_matrix(df.x, 1)
	coeff_linear = fit_no_reg(design_matrix, df.y)
end

function predict_linear_model(df::AbstractDataFrame, θ::AbstractVector; order::Integer = 1)
        design_matrix = calc_design_matrix(df.x, 1)
	predict_general_linear_model(design_matrix, θ)
end

# Functions for more complex model
function fit_quadratic_model(df::AbstractDataFrame)
	design_matrix = calc_design_matrix(df.x, 2)
	coeff_linear = fit_no_reg(design_matrix, df.y)
end

function predict_quadratic_model(df::AbstractDataFrame, θ::AbstractVector)
	design_matrix = calc_design_matrix(df.x, 2)
        predict_general_linear_model(design_matrix, θ)
end
