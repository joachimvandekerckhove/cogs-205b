classdef Norm2d
% NORM2D A class for bivariate normal (BVN) distribution

	%BVN is parametrized by mean and cov matrix
	properties
		Mean double {mustBeReal, mustBeFinite} = [0 0]
		%Correlation double {mustBeReal, mustBeFinite} = 0.5
		%Variance double {mustBeReal, mustBeFinite} = [1 1]
		%Covariance double {mustBeReal, mustBeFinite} = [Variance(1) Correlation; Correlation Variance(2)]
		Covariance double {mustBeReal, mustBeFinite} = [1 0.5; 0.5 1]
	end

	%Methods
	methods
		
		%Constructor function %
		function obj = Norm2d(Mean, Covariance)
