function test(pseudonym)
% Set deadpool as default pseudonym
    if nargin<1
        pseudonym = 'deadpool';
    end

% Check for class Norm2d
    try
        this = [];
        eval(sprintf('this = %s.Norm2d();', pseudonym))
    catch me
        fprintf('I couldn''t find a class named %s.Norm2d.\n', pseudonym);
        throw(me)
    end

    throwAsCaller = @(x)warning(x.message);

%% Report
% Start printing a little report to screen
% make a long line
    dashline = repmat('-', 1, 77);

% print a line
    fprintf('#%s#\n', dashline);

% print time and date
    fprintf('# %74s  #\n', datestr(now))

% print report title
    fprintf('#%-77s#\n', sprintf('  Test suite for "%s"  ', class(this)))

% print a line
    fprintf('#%s#\n', dashline); 
end