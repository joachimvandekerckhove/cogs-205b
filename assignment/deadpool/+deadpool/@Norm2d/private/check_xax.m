function check_xax(xax)
	% Check for error('Support must be a real finite value')
	validateattributes(xax,{'numeric'}, {'finite','real'});

	if ~(size(xax,1)==2)
        error('Support must have size of 2.')
    end
end