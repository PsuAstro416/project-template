function plot_linear_model!(plt, df_train::AbstractDataFrame, df_test::AbstractDataFrame, y_pred::AbstractVector; color=:green)
	@assert size(df_test,1) == length(y_pred)
	plot!(plt, df_test.x, y_pred, linecolor=color, lw=4, label=:none)
	scatter!(plt, df_test.x, df_test.y, markercolor=:blue, markersize=3, label=L"\alpha")
	scatter!(plt, df_train.x, df_train.y, markercolor=:red, markersize=3, label=L"\beta")
end

function plot_linear_model(df_train::AbstractDataFrame, df_test::AbstractDataFrame, y_pred::AbstractVector;  title = "", color=:green )
	plt = plot(xlabel="x", ylabel="y", title=title)
	plot_linear_model!(plt, df_train, df_test, y_pred; color)
end

function plot_linear_model_residuals!(plt, df_train::AbstractDataFrame, df_test::AbstractDataFrame, y_pred_train::AbstractVector, y_pred_test::AbstractVector)
	@assert size(df_train,1) == length(y_pred_train)
	@assert size(df_test,1) == length(y_pred_test)
	scatter!(plt, df_test.x, df_test.y.-y_pred_test, markercolor=:blue, markersize=3, label=L"\alpha")
	scatter!(plt, df_train.x, df_train.y.-y_pred_train, markercolor=:red, markersize=3, label=L"\beta")
end


function plot_linear_model_residuals(df_train::AbstractDataFrame, df_test::AbstractDataFrame, y_pred_train::AbstractVector, y_pred_test::AbstractVector)
	plt = plot(xlabel="x", ylabel="Residuals")
	plot_linear_model_residuals!(plt,df_train,df_test, y_pred_train, y_pred_test)
end

