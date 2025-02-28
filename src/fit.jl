function fit_no_reg(A::AbstractArray{T,2}, y::AbstractVector) where {T<:Number}
        @assert size(A,1) == length(y)
        ATA = A' * A
        ATy = A' * y
        ATA \ ATy 
end 

function fit_linear_model(df::AbstractDataFrame)
	design_matrix_train = hcat(ones(size(df,1)), df.x )
	coeff_linear = fit_no_reg(design_matrix_train, df.y)
end

function predict_linear_model(df::AbstractDataFrame, θ::AbstractVector)
        A = hcat(ones(size(df,1)), df.x )
        predict_linear_model(A, θ)
end

function predict_linear_model(design_matrix::AbstractMatrix, θ::AbstractVector)
	@assert length(θ) == 2
	return design_matrix * θ
end

