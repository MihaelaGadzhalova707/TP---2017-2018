class ApplicationController < ActionController::Base
	protect_from_forgery with: :null_sessions
	require 'csv'

	def sums
		
		array = CSV.parse(params["file"].read, converters: :numeric)
		sum = 0
		for i in 0..array.length - 1
			sum += array[i][0]
		end
		render plain: "%.2f" % sum.ceil
	end


	def filters
		array = CSV.parse(params["file"].read, converters: :numeric)
		sum = 0
		for i in 0..array.length - 1
			if array[i][2] % 2 != 0
				sum = sum + array[i][1]
			end
		end
		render plain: "%.2f" % sum.ceil
		
	end

	
end


