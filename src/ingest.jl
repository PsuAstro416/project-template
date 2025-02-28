function get_data(n::Integer)
	@assert 1 <= n <= 1000
	x_obs = sort(rand(n))
	σ_obs = 0.01 .* ones(n)
	y_obs = 1.0 .+ x_obs .+ σ_obs .* randn(n)
	df_all = DataFrame(:x=>x_obs, :y=>y_obs, :σy=>σ_obs)
end

function validate_data(df::AbstractDataFrame)
	if size(df,1) < 5 
		return false
	end
	if minimum(df.x) < 0
		return false
	end
	return true
end

function make_train_test(df::AbstractDataFrame; frac_train::Real = 0.75)
	x_shuffled, y_shuffled, σy_shuffled= shuffleobs((df.x,df.y,df.σy))
    train_data, test_data = splitobs((x_shuffled, y_shuffled, σy_shuffled); at=frac_train)
    df_train = DataFrame([:x,:y,:σy].=>train_data)
    df_test = DataFrame([:x,:y,:σy].=>test_data)
	return (;df_train, df_test)
end

