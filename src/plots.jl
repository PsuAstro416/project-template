function plot_linear_model(df_train::AbstractDataFrame, df_test::AbstractDataFrame, y_pred::AbstractVector)
	@assert size(df_test,1) == length(y_pred)
	plt = plot(xlabel="x", ylabel="y")
	plot!(plt, df_test.x, y_pred, linecolor=:green, lw=4, label=:none)
	scatter!(plt, df_test.x, df_test.y, markercolor=:blue, markersize=3, label=L"\alpha")
	scatter!(plt, df_train.x, df_train.y, markercolor=:red, markersize=3, label=L"\beta")
end

function plot_linear_model_residuals(df_train::AbstractDataFrame, df_test::AbstractDataFrame, y_pred_train::AbstractVector, y_pred_test::AbstractVector)
	@assert size(df_train,1) == length(y_pred_train)
	@assert size(df_test,1) == length(y_pred_test)
	plt = plot(xlabel="x", ylabel="Residuals")
	scatter!(plt, df_test.x, df_test.y.-y_pred_test, markercolor=:blue, markersize=3, label=L"\alpha")
	scatter!(plt, df_train.x, df_train.y.-y_pred_train, markercolor=:red, markersize=3, label=L"\beta")
end

