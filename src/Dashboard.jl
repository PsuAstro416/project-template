module Dashboard

using DataFrames
using MLUtils

include("ingest.jl")
export get_data, validate_data, make_train_test

include("fit.jl")
export fit_linear_model, predict_linear_model


using Plots, ColorSchemes, LaTeXStrings

include("plots.jl")
export plot_linear_model, plot_linear_model_residuals

end # module Dashboard
